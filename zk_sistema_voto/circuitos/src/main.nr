use poseidon::poseidon2;
//use dep::std;
mod merkle_tree;


/// Circuito Principal de Votacao ZKP
fn main(
    // Entradas Privadas (Witness) 
    cpf: Field,
    titulo: Field,
    voto: Field,
    segredo: Field,               // Chave privada do eleitor para o Nullifier
    merkle_proof: [Field; 20],    // Prova de inclusao (vizinhos na arvore)
    is_left: [bool; 20],          // Direcaoo da prova (true se o no atual for esquerda)

    // Entradas Publicas 
    merkle_root: pub Field,       // Raiz oficial da lista de eleitores
    nullifier: pub Field,         // Anulador unico para evitar voto duplo
    voto_compromisso: pub Field,  // Hash publico do voto (para auditoria)
    sessao: pub Field             // ID da eleicao/sessao
) {
    // 1. Validar intervalo do voto [1-10]
    validar_intervalo_voto(voto);

    // 2. Calcular a Identidade do Eleitor (Leaf)
    let leaf: Field = poseidon2::Poseidon2::hash([cpf, titulo],2);

    // 3. Verificar Elegibilidade via Merkle Tree
    // Reconstro a raiz a partir da prova privada e compara com a raiz publica
    let raiz_calculada: Field = merkle_tree::compute_merkle_root(leaf, merkle_proof, is_left);
    assert(raiz_calculada == merkle_root, "Eleitor nao encontrado na lista oficial.");

    // 4. Prevenir Voto Duplo (Nullifier)
    // O nullifier deve ser gerado: hash(segredo, sessao)
    let nullifier_calculado: Field = poseidon2::Poseidon2::hash([segredo, sessao], 2);
    assert(nullifier_calculado == nullifier, "Anulador invalido.");

    // 5. Garantir Integridade do Voto (Commitment)
    // Prova que o voto_compromisso publico corresponde ao voto_privado
    let compromisso_calculado: Field = poseidon2::Poseidon2::hash([voto, segredo], 2);
    assert(compromisso_calculado == voto_compromisso, "Compromisso do voto nao corresponde.");
}

// Funcoes auxiliares

fn validar_intervalo_voto(voto: Field) {
    let voto_u32 = voto as u32;
    assert(voto_u32 >= 1, "Voto deve ser no minimo 1.");
    assert(voto_u32 <= 10, "Voto deve ser no maximo 10.");
}