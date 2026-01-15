use dep::std::hash::poseidon;
mod merkle;
use crate::main;

#[test]
fn test_voto_valido() {
    // dados de exemplo
    let cpf = 12345678900;
    let titulo = 98765;
    let voto = 7; // Dentro do intervalo [1 -10]
    let secret = 555555;
    let sessao = 2025100;

    // leaf e proof trivial (árvore de 1 no -> root = leaf)
    let leaf = poseidon::hash([cpf, titulo]);
    let mut proof: [Field; 20] = [0; 20];
    let mut is_left: [bool; 20] = [true; 20];

    // Calculo de qual raiz resultante para o teste passar
    let mut current_root = leaf;
    for i in 0..20{
        current_root = poseidon::hash([current_root],0);
    }
    let nullifier: Field = poseidon::hash([secret, sessao]);
    let vote_commit: Field = poseidon::hash([voto, secret]);

    // Executa o circuito
    main(
        cpf,
        titulo,
        voto,
        secret,
        proof,
        is_left,
        merkle_root,
        nullifier,
        vote_commit,
        sessao
    );
}

#[test(should_fail_with = "Voto deve ser no maximo de 10 canditatos.")]
fn test_voto_invalido_fora_intervalo() {
    // Dados de exemplo
    let cpf = 1134567890;
    let titulo = 56789;
    let voto = 11; // invalido ( >10 )
    let secret = 777777;
    let sessao = 2025100;
   

    let leaf = poseidon::hash([cpf, titulo]);
    let mut proof: [Field; 20] = [0; 20];
    let mut is_left: [bool; 20] = [true; 20];
    
    let mut root = leaf;
    for i in 0..20{
        root = poseidon::hash([root, 0]);
    }

    let nullifier: Field = poseidon::hash([secret, sessao]);
    let vote_commit: Field = poseidon::hash([voto, secret]);

    // Executa o circuito
    main(
        cpf,
        titulo,
        voto,
        secret,
        proof,
        is_left,
        merkle_root,
        nullifier,
        vote_commit,
        sessao
    );
}

#[test(should_fail_with = "Eleitor nao encontrado na lista oficial.")]
fn test_merkle_proof_incorreta() {
    // Dados de exemplo
    let cpf = 7891474562;
    let titulo = 96345;
    let voto = 2;
    let secret = 789;
    let sessao = 2025200;    

    let leaf = poseidon::hash([cpf, titulo]);

    // proof incorreto (preenchido com 1s) - raiz será diferente
    let mut proof: [Field; 20] = [0; 20];
    let mut is_left: [bool; 20] = [true; 20];

    // raiz falsa (não corresponde ao leaf)
    let root_errada = 999999;

    let nullifier: Field = poseidon::hash([secret, sessao]);
    let vote_commit: Field = poseidon::hash([voto, secret]);

    // Executa o circuito
    main(
        cpf,
        titulo,
        voto,
        secret,
        proof,
        is_left,
        merkle_root,
        nullifier,
        vote_commit,
        sessao
    );
}