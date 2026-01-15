// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @notice Interface para o verificador gerado pelo Noir (Barretenberg)
 * @dev O noir normalmente gera um contrato com a função 'verifiy'
 * Se o seu contrato gerado usar 'verifyproof', ajuste o nome abaixo.
 */
interface IVerifier {
    function verify(bytes calldata proof, bytes32[] calldata _publicInputs) external view returns (bool);
}
/**
 * @title Sistema de Votacao Anonimo
 * @author Luiz Fernando Pereira
 * @notice Contrato para receber votos anonimos verificados por prova ZKP
 */

contract Sistema_Votacao{
    /// owner / admin
    address public admin;

    /// Verifier contrato (deve ser deployado e configurado com o verifier gerado pelo sistema de prova backend escolhido)
    IVerifier public verifier;

    /// Marca anuladores(nullifiers) ja usados: nullifier => usado (impede voto duplo)
    mapping(uint256 => bool) public usedNullifier;

    /// sessao => merkleroot (raiz dos eleitores elegiveis)
    mapping(uint256 => bytes32) public merkleRootPorSessao;

    /// sessao => array de compromissos de voto (para contagem futura)
    mapping(uint256 => bytes32[]) public votoPorSessao;

    /// Emitido quando o voto e aceito com sucesso
    /// nao incluir msg.sender para preservar o anonimato
    event VoteSubmitted(bytes32 indexed votoCommit, uint256 indexed sessao, uint256 timestamp);

    /// Emitido quando uma raiz merkle para uma sessao e definida/atualizada
    event MerkleRootSet (uint256 indexed sessao, bytes32 merkleRoot);

    /// Emitido quando o endereco do verificado e alterado
    event VerifierUpdated(address indexed novoVerificador);

    event OwnershipTransferred(address indexed antigoAdming, address indexed novoAdmin);

    modifier onlyOwnner() {
        require(msg.sender == admin, "Apenas o proprietario");
        _;
    }

    constructor(address _verifier){
        admin = msg.sender;
        if(_verifier != address(0)){
            verifier = IVerifier(_verifier);
        }
    }

    /// @notice Define ou atualiza o endereco do contrato do verificador
    function setVerifier(address _verifier) external onlyOwnner {
        require(_verifier != address(0), "Endereco zero nao permitido" );
        verifier = IVerifier(_verifier);
        emit VerifierUpdated(_verifier); 
    }
    
    /// @notice Define a raiz Merkle para uma determinada sessao    
    function setMerkleRoot(uint256 sessao, bytes32 root) external onlyOwnner {
        merkleRootPorSessao[sessao] = root;
        emit MerkleRootSet(sessao, root);
    }

    /// @notice Define se um anulador ja foi utilizado
    function isNullifierUsed(uint256 nullifier) external view returns (bool){
        return usedNullifier[nullifier];
    }

    /// @notice Envia o voto junto com a prova de zero conhecimento e as entradas publicas
    /**
     * @notice Submete o voto anonimo
     * @param proof Prova gerada pelo backend barretenberg
     * @param merkleRoot Raiz da arvore de eleitores
     * @param nullifier Identificador unico do voto (evita gasto duplo)
     * @param votoCommit Hash do voto + segredo
     * @param sessao ID da eleicao/sessao
     */
    function submitVote(bytes calldata proof, bytes32 merkleRoot, uint256 nullifier, bytes32 votoCommit, uint256 sessao) external {
        // Verificacao basica
        require(address(verifier) != address(0), "Verificador nao definido.");

        // O contrato armazena a raiz merkle autoritativa para a sessao
        // rejeita se o prover (provador) reinvidicar a raiz diferente
        bytes32 storedRoot = merkleRootPorSessao[sessao];
        require(storedRoot != bytes32(0), "Sessao nao registrada."); // nenhuma raiz definida
        require(storedRoot == merkleRoot, "Incompatibilidade da raiz merkle.");

        // Previne voto duplo: nullifier(anulador) deve ser usado
        require(!usedNullifier[nullifier], "Voto ja realizado (Nullifier usado).");

        //** *OBS IMPORTANTE: A ordem dos sinais publico deve ser identica a ordem de no Noir (main.nr) */
        // Cria matriz de sinais publicos para enviar ao verificador
        // A ordem deve corresponder as saidas publicas do circuito
        // Converte bytes32 em uint256 para os sinais publicos do verificador
        bytes32[] memory publicSignals = new bytes32[](4);

        publicSignals[0] = merkleRoot;
        publicSignals[1] = bytes32(nullifier);
        publicSignals[2] = votoCommit;
        publicSignals[3] = bytes32(sessao);
        
        // Chamada ao verificador ZKP
        bool ok = verifier.verify(proof, publicSignals);
        require(ok, "Prova ZKP invalida.");

        // Efeito: registra o uso para evitar voto duplo
        usedNullifier[nullifier] = true;

        // Marca o nullifier como usado
        usedNullifier[nullifier] = true;

        // Armeza o votoCommit para a sessao permitir a contagem posterior
        votoPorSessao[sessao].push(votoCommit);

        emit VoteSubmitted(votoCommit, sessao, block.timestamp);
    
    }
    function getVotosSessao(uint256 sessao) external view returns (bytes32[] memory){
        return votoPorSessao[sessao];
    }
    function transfereProprietario(address novoAdmin) external onlyOwnner{
        require(novoAdmin != address(0), "Endereco Zero.");
        emit OwnershipTransferred(admin, novoAdmin);
        admin = novoAdmin;
    }
    
}
