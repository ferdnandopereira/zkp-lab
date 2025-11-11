pub fn main(x: Field, y: pub Field) {
    assert(x != y);
}

// Teste deve passar: Test OK
#[test]
fn test_main_pass(){
    main(1, 2);
}

// Teste deve falhar: Test FAIL
#[test(should_fail_with = "x deve ser diferente de y")]
fn test_main_fail(){
    main(1, 1);
}