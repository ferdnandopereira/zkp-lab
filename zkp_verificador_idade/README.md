# Circuito Noir – Verificador de Idade

[![Language](https://img.shields.io/badge/Noir-Language-blue.svg)](https://noir-lang.org/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![ZK-Proof](https://img.shields.io/badge/ZK-SNARKs-orange.svg)]()

## Descrição

Este projeto implementa um sistema de **prova de idade em Zero-Knowledge**, onde:

- o usuário **informa sua idade em segredo**.
- um circuito Noir gera uma **prova criptografica off-chain**.
- essa prova é verificada **on-chain** em um contrato inteligente Solidity.
- um fronted web (HTML + CSS + JS) permite a interação com Noir e com a blockchain.

---

## Estrutura do Circuito

Arquivo: main.nr

```rust
pub fn main(idade: Field, idade_min: pub Field) {
    
    // Cast nos Fields para u8 antes de comparar
    assert(idade as u8 >= idade_min as u8, "idade deve ser maior do que 18 anos");
}
```
---

## O que o circuito verifica ?

A constraint(restrição):

```rust
assert(idade as u8 >= idade_min as u8);
```


## Explicação

```assert(idade as u8 >= idade_min as u8)```

A expressão acima é a ***constraint principal*** do circuito, garante que:

- ```idade```: **valor privado**, não revelado.
- ```idade_min```: **valor público**, normalmente 18.
- ```as u8 ```: Converte o Field para um tipo inteiro. Um ```u8``` variável pode armazenar um valor no intervalo de 0 a 255.

Nenhuma idade real é revelada no processo.

A única coisa exposta é a prova matemática de que o usuário possui idade **>= 18 anos.**

---

## Testes

O arquivo contém seis testes automáticos integrados:

| **Teste** | **Descrição** | **Entrada** ```(idade, idade_min)```|
|:---------:|:---------------:|:-----------------------:|
|```test_maior_idade```| Verifica se o circuito passa quando ```x != y```| (20, 18)|
|```test_exatamente_18```| Verifica se o circuito falha quando ```x = y```| (18, 18)|
|```test_idade_avancada```| Verifica se o usuário possui idade avançada | (50, 18)|
|```test_menor_idade```| Verifica se o usuário é menor de idade | (16, 18) |
| ```test_muito_jovem```| Verifica se o usuário ainda é jovem | (12, 18) |
|```test_recem_nascido```| Verifica se usuário é recém-nascido | (1, 18) |

---

## Executando os testes

Para compilar e executar o circuito manualmente com valores personalizados:

**1 - Verificação do código e dependências:**

```nargo check```

**2 - Compilar o circuito:**

```nargo compile```

**3 - Execute com inputs personalizados:**

No arquivo ***Prover.toml***, adicione valores personalizados para os inputs, como exemplo, ```idade = 20```, e ```idade_min = 18```. 

E execute: ```nargo compile```

**4 - Executando os testes:**

```nargo test```

Saída esperada no terminal:

```Running 6 test functions```

``` Testing test_menor_idade ... ok ``` 

```  Testing test_idade_avancada ... ok ``` 

```  Testing test_exatamente_18 ... ok ``` 

```  Testing test_muito_jovem ... ok ```

```   Testing test_recem_nascido ... ok ```

```  Testing test_maior_idade ... ok ``` 

```  6 tests passed ``` 


**5 - Gerar a prova:**

Para a geração da prova, o circuito backend de prova usado, **Barretenberg** (ou **bb** para abreviar) é uma biblioteca de curva elíptica otimizada para a curva **bn128** e um provador **PLONK SNARK**.


**Instalação:**

Inspirado por ```rustup```, ```noirup``` e ferramentas semelhantes, você pode usar o ```bbup``` script de instalação para instalar e atualizar rapidamente a ferramenta CLI do Barretenberg:


```bash
curl -L https://raw.githubusercontent.com/AztecProtocol/aztec-packages/refs/heads/next/barretenberg/bbup/install | bash 
```

```bash
bbup
```

Seguindo essas instruções, você poderá ver bb binário em $HOME/.bb/bb.

Como queremos verificar a prova mais tarde, também queremos gravar a chave de verificação em um arquivo. Vamos fazer isso:

```bash
bb prove -b ./target/zkp_verificador_idade.json -w ./target/zkp_verificador_idade.gz --write_vk -o target 
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
bb write_vk -b ./target/zkp_verificador_idade.json -o ./target --oracle_hash keccak
```
**7.1 - Gerando o Smart Contract à partir da vk, verification key:**

```bash
bb write_solidity_verifier -k ./target/vk -o ./target/Verificador.sol
```
## Autor

Desenvolvido por Luiz Fernando Pereira, no contexto de estudos sobre ***Zero-Knowledge Proofs***, e Verificadores Lógicos em Noir.


