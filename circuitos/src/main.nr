use poseidon::poseidon2;
//use dep::std;
mod merkle_tree;
mod testes;
//mod extrair_dados;

/// Circuito Principal de Votacao ZKP
fn main(
    // Entradas Privadas (Witness) 
    cpf: Field,
    titulo: Field,
    voto: Field,
    segredo: Field,               // Chave privada do eleitor para o Nullifier
    merkle_proof: [Field; 20],    // Prova de inclusao (vizinhos na arvore)
    is_left: [bool; 20],          // Direcao da prova (true se o no atual for esquerda)

    // Entradas Publicas 
    merkle_root: pub Field,       // Raiz oficial da lista de eleitores
    nullifier: pub Field,         // Anulador unico para evitar voto duplo
    voto_compromisso: pub Field,  // Hash publico do voto (para auditoria)
    sessao: pub Field             // ID da eleicao/sessao
) {
    // Apenas para debug
    let teste: Field = poseidon2::Poseidon2::hash([1,1],2);
    println(f"Valor do HASH no Noir: {teste}\n");

    // 1. Validar intervalo do voto [1-10]
    validar_intervalo_voto(voto);

    // 2. Calcular a Identidade do Eleitor (Leaf)
    let leaf: Field = poseidon2::Poseidon2::hash([cpf, titulo],2);

    // 3. Verificar Elegibilidade via Merkle Tree
    let raiz_calculada: Field = merkle_tree::compute_merkle_root(leaf, merkle_proof, is_left);
    println(f"DEBUG: Raiz calculada pelo circuito: {raiz_calculada}\n");
    println(f"DEBUG: Raiz fornecida no Prover.toml: {merkle_root}\n");
    assert(raiz_calculada == merkle_root, "Eleitor nao encontrado na lista oficial.\n");

    // 4. Prevenir Voto Duplo (Nullifier)
    // O nullifier deve ser gerado: hash(segredo, sessao)
    let nullifier_calculado: Field = poseidon2::Poseidon2::hash([segredo, sessao], 2);
    println(f"DEBUG: Nullifier calculado pelo circuito: {nullifier_calculado}\n");
    println(f"DEBUG: Nullifier fornecido no Prover.toml: {nullifier}\n");
    assert(nullifier_calculado == nullifier, "Anulador invalido.\n");

    // 5. Garantir Integridade do Voto (Commitment)
    // Prova que o voto_compromisso publico corresponde ao voto_privado
    let compromisso_calculado: Field = poseidon2::Poseidon2::hash([voto, segredo], 2);
    println(f"DEBUG: Compromisso de Voto calculado pelo circuito: {compromisso_calculado}\n");
    println(f"DEBUG: Compromisso de Voto fornecido no Prover.toml: {voto_compromisso}\n");
    assert(compromisso_calculado == voto_compromisso, "Compromisso do voto nao corresponde.\n");
}

// Funcoes auxiliares

fn validar_intervalo_voto(voto: Field) {
    let voto_u32 = voto as u32;
    assert(voto_u32 >= 1, "Voto deve ser no minimo 1.\n");
    assert(voto_u32 <= 10, "Voto deve ser no maximo de 10 canditatos.\n");
}

// Observacao
//1- O eleitor preenche os dados (CPF, Titulo, Voto, Segredo).

//2 - O front-end calcula a Merkle Proof e o Nullifier.

//3 - O NoirJS + Barretenberg (WASM) geram a prova .proof no browser.

//4 - A carteira (MetaMask) assina a transacao enviando a prova para o seu contrato Sistema_Votacao.sol.