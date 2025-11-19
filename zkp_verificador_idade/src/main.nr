pub fn main(idade: Field, idade_min: pub Field) {
    
    // Cast nos Fields para u8 antes de comparar
    assert(idade as u8 >= idade_min as u8, "idade deve ser maior do que 18 anos");
}

// Testes que devem passar - OK
#[test]
fn test_maior_idade() {
    main(20, 18);
}

#[test]
fn test_exatamente_18() {
    main(18, 18);
}

#[test]
fn test_idade_avancada() {
    main(50, 18);
}
// Testes que devem falhar - FAIL 
#[test(should_fail)]
fn test_menor_idade() {
    main(16, 18);
}

#[test(should_fail)]
fn test_muito_jovem() {
    main(13, 18);
}

#[test(should_fail)]
fn test_recem_nascido() {
    main(1, 18);
}