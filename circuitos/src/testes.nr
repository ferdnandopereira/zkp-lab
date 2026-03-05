use poseidon::poseidon2;
use crate::main;
use crate::merkle_tree;

#[test]
fn test_voto_valido() {
    // dados de exemplo
    let cpf = 12345678900;
    let titulo = 98765;
    let voto = 7; // Dentro do intervalo [1 -10]
    let segredo = 555555;
    let sessao = 2025100;

    // leaf e proof trivial (arvore de 1 no -> root = leaf)
    let leaf = poseidon2::Poseidon2::hash([cpf, titulo], 2);
    
    let nullifier = poseidon2::Poseidon2::hash([segredo, sessao], 2);
    let voto_compromisso = poseidon2::Poseidon2::hash([voto, segredo], 2);

    // Setup trivial para o teste: raiz e o hash da leaf
    let mut proof: [Field; 20] = [0; 20];
    let mut is_left: [bool; 20] = [true; 20];
    let merkle_root: Field = merkle_tree::compute_merkle_root(leaf, proof, is_left);
    
    // Executa o circuito
    main( cpf, titulo, voto, segredo, proof, is_left, merkle_root, nullifier, voto_compromisso, sessao);
}

#[test(should_fail_with = "Voto deve ser no maximo de 10 canditatos.")]
fn test_voto_invalido_fora_intervalo() {
    // Dados de exemplo
    let cpf: Field = 1134567890;
    let titulo: Field = 56789;
    let voto: Field = 11; // invalido ( >10 )
    let segredo: Field = 777777;
    let sessao: Field = 2025100;   

    let leaf: Field = poseidon2::Poseidon2::hash([cpf, titulo], 2);
    let nullifier: Field = poseidon2::Poseidon2::hash([segredo, sessao], 2);
    let voto_compromisso: Field = poseidon2::Poseidon2::hash([voto, segredo], 2);

    let proof: [Field; 20] = [0; 20];
    let is_left: [bool; 20] = [true; 20];
    let merkle_root: Field = leaf;

    main(cpf, titulo, voto, segredo, proof, is_left, merkle_root, nullifier, voto_compromisso, sessao);
    
}    

#[test(should_fail_with = "Eleitor nao encontrado na lista oficial.")]
fn test_merkle_proof_incorreta(){
    // Dados de exemplo
    let cpf: Field = 7891474562;
    let titulo: Field = 96345;
    let voto: Field = 2;
    let segredo: Field = 789;
    let sessao: Field = 2025200;

    let leaf: Field = poseidon2::Poseidon2::hash([cpf, titulo], 2);
    let nullifier: Field = poseidon2::Poseidon2::hash([segredo, sessao], 2);
    let voto_compromisso: Field = poseidon2::Poseidon2::hash([voto, segredo], 2);

    let proof: [Field; 20] = [0; 20]; // Proof padrao
    let is_left: [bool; 20] = [true; 20];
    let merkle_root: Field = merkle_tree::compute_merkle_root(leaf, proof, is_left);
    let merkle_root: Field = 123456789123456789; // Raiz incorreta para falhar propositalmente

    main(cpf, titulo, voto, segredo, proof, is_left, merkle_root, nullifier, voto_compromisso, sessao);

}
   