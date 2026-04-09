use crate::main;
use crate::merkle_tree;
use poseidon::poseidon2;

// Voto 100% ok
#[test]
fn test_voto_valido() {
    // dados de exemplo
    let cpf: Field = 12345678900;
    let titulo: Field = 98765;
    let voto: Field = 7; // Dentro do intervalo [1 -10]
    let segredo: Field = 555555;
    let sessao: Field = 2025100;

    // No caso valido, o ID publico e igual ao voto privado
    let candidato_id_publico = voto;
    // leaf e proof trivial (arvore de 1 no -> root = leaf)
    let leaf: Field = poseidon2::Poseidon2::hash([cpf, titulo], 2);

    let nullifier: Field = poseidon2::Poseidon2::hash([segredo, sessao], 2);
    let voto_compromisso: Field = poseidon2::Poseidon2::hash([voto, segredo], 2);

    // Setup trivial para o teste: raiz e o hash da leaf
    let mut merkle_proof: [Field; 20] = [0; 20];
    let mut is_left: [bool; 20] = [true; 20];
    let merkle_root: Field = merkle_tree::compute_merkle_root(leaf, merkle_proof, is_left);

    // Executa o circuito
    main(
        cpf,
        titulo,
        voto,
        segredo,
        merkle_proof,
        is_left,
        merkle_root,
        nullifier,
        candidato_id_publico,
        voto_compromisso,
        sessao,
    );
}

// Inputs invalidos
#[test(should_fail_with = "Voto deve ser no maximo de 10 canditatos.")]
fn test_voto_invalido_fora_intervalo() {
    // Dados de exemplo
    let cpf: Field = 1134567890;
    let titulo: Field = 56789;
    let voto: Field = 11; // invalido ( >10 )
    let segredo: Field = 777777;
    let sessao: Field = 2025100;
    let candidato_id_publico: Field = 11;

    let leaf: Field = poseidon2::Poseidon2::hash([cpf, titulo], 2);
    let nullifier: Field = poseidon2::Poseidon2::hash([segredo, sessao], 2);
    let voto_compromisso: Field = poseidon2::Poseidon2::hash([voto, segredo], 2);

    let merkle_proof: [Field; 20] = [0; 20];
    let is_left: [bool; 20] = [true; 20];
    let merkle_root: Field = leaf;

    main(
        cpf,
        titulo,
        voto,
        segredo,
        merkle_proof,
        is_left,
        merkle_root,
        nullifier,
        candidato_id_publico,
        voto_compromisso,
        sessao,
    );
}

// Inconsistencia de credencial
#[test(should_fail_with = "Eleitor nao encontrado na lista oficial.")]
fn test_merkle_proof_incorreta() {
    // Dados de exemplo
    let cpf: Field = 7891474562;
    let titulo: Field = 96345;
    let voto: Field = 2;
    let segredo: Field = 789;
    let sessao: Field = 2025200;
    let candidato_id_publico: Field = 2;

    let leaf: Field = poseidon2::Poseidon2::hash([cpf, titulo], 2);
    let nullifier: Field = poseidon2::Poseidon2::hash([segredo, sessao], 2);
    let voto_compromisso: Field = poseidon2::Poseidon2::hash([voto, segredo], 2);

    let merkle_proof: [Field; 20] = [0; 20]; // Proof padrao
    let is_left: [bool; 20] = [true; 20];
    let _merkle_root_correta: Field = merkle_tree::compute_merkle_root(leaf, merkle_proof, is_left);
    let merkle_root_errada: Field = 123456789123456789; // Raiz incorreta para falhar propositalmente

    main(
        cpf,
        titulo,
        voto,
        segredo,
        merkle_proof,
        is_left,
        merkle_root_errada,
        nullifier,
        candidato_id_publico,
        voto_compromisso,
        sessao,
    );
}

