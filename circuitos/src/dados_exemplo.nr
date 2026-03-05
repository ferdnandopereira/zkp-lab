use poseidon::poseidon2;
use crate::merkle_tree;
use crate::main;

#[test]
fn dados_exemplo(){
    // Entradas
    let cpf = 12345678901;
    let titulo = 987654321;
    let segredo = 42424242424242;
    let voto = 7;
    let sessao = 1001;

    // 1 - Calculo de hashes
    let leaf = poseidon2::Poseidon2::hash([cpf, titulo], 2);
    let nullifier = poseidon2::Poseidon2::hash([segredo, sessao], 2);
    let voto_compromisso = poseidon2::Poseidon2::hash([voto, segredo], 2);

    // 2 - Simulacao de Merkle Proof com caminho de 20 nos irmaos
    let mut nos_irmaos: [Field; 20] = [1; 20];
    let is_left: [bool; 20] [true; 20]

    // 3 - Calcula a raiz baseada no leaf e nos irmaos
    let root = merkle_tree::compute_merkle_root(leaf, nos_irmaos, is_left);

    // 4 - Saida para o terminal
    println(f"Leaf para Merkle Tree: {leaf}");
    println(f"Nullifier gerado: {nullifier}");
    println(f"Compromisso de Voto gerado: {voto_compromisso}");
    println(f"Merkle Root: {root}");
    println(f"Nos irmaos gerado (merkle proof): {nos_irmaos}");
    
}
