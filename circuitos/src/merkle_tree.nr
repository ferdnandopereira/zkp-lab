use poseidon::poseidon2;

pub fn compute_merkle_root(
    leaf: Field, // folha da arvore merkle
    merkle_proof: [Field; 20],
    is_left: [bool; 20], // verifica se e uma folha par ou impar
) -> Field {
    let mut current_hash: Field = leaf;

    for i in 0..20{
        // a ordem no hash poseidon altera o resultado final
        // se a folha (ou o hash acumulado) for o no de esquerda
        // o elemento da prova (merkle_proof) deve ser o da direita
        let(left,right) = if is_left[i] {
            (current_hash, merkle_proof[i])
        } else {
            (merkle_proof[i], current_hash)
        };

        // calcula o hash do nivel atual para subir um degrau da arvore
        current_hash = poseidon2::Poseidon2::hash([left,right ],2);
       
    }
    current_hash
}