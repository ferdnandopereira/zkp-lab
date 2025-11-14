# Circuito Noir – Verificador de Diferença entre Campos

[![Language](https://img.shields.io/badge/Noir-Language-blue.svg)](https://noir-lang.org/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![ZK-Proof](https://img.shields.io/badge/ZK-SNARKs-orange.svg)]()

## Descrição

Este projeto implementa um circuito simples em *Noir* que verifica se dois valores de campo (**Fields**) são diferentes entre si.

O objetivo é demonstrar a estrutura básica de **verificação lógica** com assert e a utilização de *testes unitários* em Noir.

Servir de base para circuitos de verificação lógica mais complexos, como comparadores, autenticação ou provas de consistência.

O circuito também exemplifica a distinção entre **inputs públicos e privados**, conceito essencial em aplicações ZK que buscam preservar privacidade sem comprometer a verificação.

---

## Estrutura do Circuito

Arquivo: main.nr

```rust
pub fn main(x: Field, y: pub Field) {
    assert(x != y);
}

// Teste deve passar: Test OK
#[test]
fn test_main_pass() {
    main(1, 2);
}

// Teste deve falhar: Test FAIL
#[test(should_fail_with = "x deve ser diferente de y")]
fn test_main_fail() {
    main(1, 1);
}

```
---

## Explicação

```assert(x != y)```

A expressão acima é a ***constraint principal*** do circuito - ela precisa ser verdadeira para que a prova seja válida.
Se ```x == y```, o circuito interrompe a execução e gera falha.

- A função **main** é o ponto central do circuito e recebe dois parâmetros:
- ```x```: um ***valor privado*** (não revelado ao público).
- ```y```: um ***valor público*** (divulgado ao verificador).
- O comando ```assert(x != y)```garante que os dois valores não sejam iguais.
Caso ```x``` e ```y```sejam iguais, a prova é rejeitada e o circuito falha com a mensagem ***x deve ser diferente de y***.

Em provas de zero conhecimento, esse tipo de verificação é útil para demonstrar que duas informações distintas estão sendo usadas, sem precisar revelar o valor privado ```x```.

---

## Testes

O arquivo contém dois testes automáticos integrados:

| **Teste** | **Descrição** | **Entrada** ```(x, y)```|
|:---------:|:---------------:|:-----------------------:|
|```test_main_pass```| Verifica se o circuito passa quando ```x != y```| (1, 2)|
|```test_main_fail```| Verifica se o circuito falha quando ```x = y```| (1, 1)|

---

## Executando os testes

Para compilar e executar o circuito manualmente com valores personalizados:

**1 - Verificação do código e dependências:**

```nargo check```

**2 - Compilar o circuito:**

```nargo compile```

**3 - Execute com inputs personalizados:**

No arquivo ***Prover.toml***, adicione valores personalizados para os inputs, como exemplo, ```x = 1```, e ```y = 2```. 

E execute: ```nargo compile```

**4 - Executando os testes:**

```nargo test```

Saída esperada no terminal:

```Running test_main_pass ... ok, 1 test passed```

```Running test_main_fail ... failed (x deve ser diferente de y)```

**5 - Gerar a prova:**

Para a geração da prova, o circuito backend de prova usado, **Barretenberg** (ou **bb** para abreviar) é uma biblioteca de curva elíptica otimizada para a curva **bn128** e um provador **PLONK SNARK**.


**Instalação:**

Inspirado por ```rustup```, ```noirup`` e ferramentas semelhantes, você pode usar o ```bbup``` script de instalação para instalar e atualizar rapidamente a ferramenta CLI do Barretenberg:


```bash
curl -L https://raw.githubusercontent.com/AztecProtocol/aztec-packages/refs/heads/next/barretenberg/bbup/install | bash 
```

```bash
bbup
```

Seguindo essas instruções, você poderá ver bb binário em $HOME/.bb/bb.

Como queremos verificar a prova mais tarde, também queremos gravar a chave de verificação em um arquivo. Vamos fazer isso:

```bash
bb prove -b ./target/basic_proof.json -w ./target/basic_proof.gz --write_vk -o target 
``` 

Isso provará seu programa e escreverá ambos ```proof``` e um ```vk```  arquivo para a pasta ```target```. Para verificar a prova, você não precisa da testemunha (isso anularia o propósito, não é?), apenas a prova e o ```vk```, verification key, ou chave de verificação:

**6 - Verificação da prova:**
```bash
bb verify -p ./target/proof -k ./target/vk
```
Parabéns!

Usando Noir e Barretenberg, seu verificador pode verificar a exatidão de uma prova, sem conhecer as entradas privadas.

**7 - Geração do Smart Contract:**

Ao invés de criar uma verificação que usa hashes ***Poseidons***, que também são muito otimizados para ZK, hashes ***Keccak***, são mais otimizados para ações **ON-Chain**, ou seja, o hash ***Keccak*** é usado quando se deseja compatibilidade com a **Ethereum**, pois o EVM utiliza o ***Keccak-256***.

```bash
bb write_vk -b ./target/basic_proof.json -o ./target --oracle_hash keccak
```
**7.1 - Gerando o Smart Contract à partir da vk, verification key:**

```bash
bb write_solidity_verifier -k ./target/vk -o ./target/Verificador.sol
```
## Autor

Desenvolvido por Luiz Fernando Pereira, no contexto de estudos sobre ***Zero-Knowledge Proofs***, e Verificadores Lógicos em Noir.


