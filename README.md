# ZKP Lab 
**Residência Tecnológica em Criptografia Aplica e Tecnologias Blockchain**

<div align="center">
<p align="center">
  <p align="center">
  <img src="https://img.shields.io/badge/Residência%20Tecnológica-CPQD-blue.svg" alt="Residência CPQD"/>
  <img src="https://img.shields.io/badge/Área-Criptografia%20%26%20Blockchain-4B0082.svg" alt="Criptografia & Blockchain"/>
  <img src="https://img.shields.io/badge/ZKP-Laboratório%20de%20Provas%20de%20Conhecimento%20Zero-6f42c1.svg" alt="ZKP Lab"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Made%20with-Noir-8b5cf6.svg" alt="Noir"/>
  <img src="https://img.shields.io/badge/Made%20with-Circom-0a9df5.svg" alt="Circom"/>
  <img src="https://img.shields.io/badge/Rust-1.70+-orange.svg" alt="Rust"/>
  <img src="https://img.shields.io/badge/Python-3.11+-3776AB.svg" alt="Python"/>
  <img src="https://img.shields.io/badge/Solidity-^0.8.0-363636.svg" alt="Solidity"/>
  <img src="https://img.shields.io/badge/Hyperledger-Fabric-2F3136.svg" alt="Hyperledger Fabric"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License"/>
  <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" alt="PRs Welcome"/>
  <img src="https://img.shields.io/badge/Status-Em%20Desenvolvimento-yellow.svg" alt="Status"/>
</p>
</p>
</p>

*Desenvolvimento e pesquisa colaborativa em Zero-Knowledge Proofs, privacidade e procolos criptográficos seguros*

[📖 Documentação](docs/) · [💡 Exemplos](examples/) · [🤝 Contribuir](CONTRIBUTING.md) · [🗓️ Roadmap][def]
</div>

---

## 📋 Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Objetivos](#-objetivos)
- [Tecnologias](#-tecnologias)
- [Estrutura do Repositório](#-estrutura-do-repositório)
- [Começando](#-começando)
- [Exemplos de Uso](#-exemplos-de-uso)
- [Contribuindo](#-contribuindo)
- [Roadmap](#-roadmap)
- [Publicações](#-publicações)
- [Licença](#-licença)
- [Equipe](#-equipe)
- [Contato](#-contato)

  ---
  ## 🧠 Sobre o Projeto
  O **ZKP Lab** é um repositório de pesquisa e desenvolvimento colaborativo, criado no âmbito da **Residência Tecnológica em Criptografia Aplicada e Blockchain**. 
  Este laboratório concentra-se na exploração, implementação e aplicação prática de **Zero-Knowledge Proofs (ZKPS) ** e técnicas criptográficas avançadas.

  ## Contexto
  Este projeto visa construir uma base sólida de conhecimento técnico e implementações práticas em Provas de Zero Conhecimento que possam ser aplicadas em alguns cenários de produção:
- ✅ **Autenticação sem revelação de credenciais**
- ✅ **Transações blockchain com privacidade total**
- ✅ **Verificação de conformidade preservando dados sensíveis**
- ✅ **Sistemas de identidade soberana descentralizada**

 ### Diferenciais

- 🔬 **Foco em Pesquisa Aplicada**: Implementações práticas de conceitos teóricos
- 🛠️ **Multi-Framework**: Suporte para Noir, Circom e Halo2
- 🔐 **Criptografia Pós-Quântica**: Preparação para ameaças futuras
- 📚 **Documentação Extensiva**: Tutoriais, guias e papers técnicos
- 🤝 **Open Source**: Contribuições da comunidade são bem-vindas

---
## Objetivos
### Objetivos Principais
<table>
  <tr>
    <td width="50%">
      <h4>🧩 Desenvolvimento de Circuitos ZKP</h4>
      <p>Desenvolver circuitos ZKP em linguagens modernas (Noir, Circom, Halo2).</p>
    </td>
    <td width="50%">
      <h4>🔒 Pesquisa Criptográfica</h4>
      <p>IPesquisar e aplicar protocolos criptográficos seguros e eficientes.</p>
    </td>
  </tr>
  <tr>
    <td width="50%">
      <h4>🌐 Integração Blockchain</h4>
      <p>Integrar ZKP com Blockchain para construçãode sistemas de confiança sem exposição de dados.</p>
    </td>
    <td width="50%">
      <h4>📖 Documentação Técnica</h4>
      <p>Criar uma base de conhecimento abrangente com guias, tutoriais e referências para facilitar a adoção de ZKPs na indústria.</p>
    </td>
  </tr>
</table>

### Metas de Longo Prazo

- [x] Estruturação do laboratório e metodologia de pesquisa
- [x] Implementação de circuitos básicos e intermediários
- [ ] Biblioteca de circuitos ZKP reutilizáveis e auditados
- [ ] Framework de benchmarking e análise de performance
- [ ] Integração com protocolos DeFi preservando privacidade
- [ ] Publicações científicas em conferências internacionais
- [ ] Ferramentas open-source para auditoria de circuitos
- [ ] Casos de uso em produção com parceiros da indústria

---
## ⚙️ Tecnologias

### Stack Tecnológico

<div align="center">

| **🦀 Linguagens** | **🔒 Criptografia** | **🧩 ZKP Frameworks** | **🌐 Blockchain** |
|:-----------------:|:-------------------:|:---------------------:|:-----------------:|
| Noir | OpenSSL | Noir/Nargo | Ethereum |
| Rust | Liboqs (PQC) | Circom/SnarkJS | Hyperledger Fabric |
| Python | PyCryptodome | Halo2 | zkEVM |
| Solidity | libsodium | zkSync | Polygon zkEVM |
| Go | Ring | Plonky2 | Starknet |

</div>

### Ferramentas de Desenvolvimento

<table>
  <tr>
    <td align="center" width="25%">
      <b>🧪 Testing</b><br><br>
      • Foundry<br>
      • Hardhat<br>
      • Pytest<br>
      • Nargo Test
    </td>
    <td align="center" width="25%">
      <b>📊 Análise</b><br><br>
      • Wireshark<br>
      • Scapy<br>
      • Burp Suite<br>
      • OpenSSL CLI
    </td>
    <td align="center" width="25%">
      <b>🔄 CI/CD</b><br><br>
      • GitHub Actions<br>
      • Docker<br>
      • Kubernetes<br>
      • GitLab CI
    </td>
    <td align="center" width="25%">
      <b>📝 Documentação</b><br><br>
      • MkDocs<br>
      • Jupyter<br>
      • Mermaid<br>
      • Docusaurus
    </td>
  </tr>
</table>

---

## 🧱 Estrutura do Repositório

```
zkp-lab-cpqd/
│
├── 📁 circuits/                    # Circuitos ZKP em múltiplas linguagens
│   ├── noir/                       # Implementações em Noir
│   │   ├── zkp_verificaodr_idade/  # Prova de idade
│   │   ├── vote-system/            # Sistema de votação
│   │   └── interval-prove          # Provas de intervalo
│   ├── circom/                     # Implementações em Circom
│   │   ├── voting/                 # Sistemas de votação
│   │   └── credentials/            # Credenciais verificáveis
│   └── halo2/                      # Implementações em Halo2
│       └── recursive-proof/        # Provas recursivas
│
├── 📁 contracts/                   # Smart contracts e integrações
│   ├── ethereum/                   # Contratos Solidity
│   │   ├── verifiers/              # Verificadores on-chain
│   │   └── applications/           # Aplicações DeFi privadas
│   └── hyperledger/                # Chaincode Fabric
│       └── privacy-tokens/         # Tokens privados
│
├── 📁 examples/                    # Exemplos práticos e tutoriais
│   ├── 01-basic-proof/             # Sua primeira prova ZKP
│   ├── 02-age-verification/        # Sistema de verificação de idade
│   ├── 03-private-voting/          # Votação anônima
│   ├── 04-credential-system/       # Credenciais verificáveis
│   └── 05-zkrollup/                # zkRollup básico
│
├── 📁 research/                    # Artigos e estudos científicos
│   ├── papers/                     # Papers publicados
│   ├── cryptography/               # Estudos de criptografia
│   │   ├── post-quantum/           # Criptografia pós-quântica
│   │   └── protocols/              # Protocolos customizados
│   └── benchmarks/                 # Análises de performance
│
├── 📁 tools/                       # Utilitários e scripts
│   ├── benchmarking/               # Ferramentas de benchmark
│   ├── circuit-analyzer/           # Análise de circuitos
│   ├── key-management/             # Gestão de chaves
│   └── testing/                    # Frameworks de teste
│
├── 📁 docs/                        # Documentação técnica
│   ├── getting-started/            # Guias iniciais
│   ├── tutorials/                  # Tutoriais passo a passo
│   ├── api-reference/              # Referência de APIs
│   └── best-practices/             # Boas práticas
│
├── 📁 tests/                       # Suíte de testes
│   ├── unit/                       # Testes unitários
│   ├── integration/                # Testes de integração
│   └── security/                   # Testes de segurança
│
├── 📁 assets/                      # Recursos visuais
│   ├── diagrams/                   # Diagramas técnicos
│   └── presentations/              # Apresentações
│
├── 📄 CONTRIBUTING.md              # Guia de contribuição
├── 📄 CODE_OF_CONDUCT.md           # Código de conduta
├── 📄 SECURITY.md                  # Política de segurança
├── 📄 LICENSE                      # Licença MIT
└── 📄 README.md                    # Este arquivo
```

---
## 🚀 Começando

### Pré-requisitos

Certifique-se de ter as seguintes ferramentas instaladas:

| Ferramenta | Versão Mínima | Instalação |
|------------|---------------|------------|
| **Noir/Nargo** | `>= 0.32.0` | [noir-lang.org](https://noir-lang.org/docs/getting_started/installation) |
| **Rust** | `>= 1.70` | [rustup.rs](https://rustup.rs/) |
| **Node.js** | `>= 18.0` | [nodejs.org](https://nodejs.org/) |
| **Python** | `>= 3.10` | [python.org](https://www.python.org/downloads/) |
| **Docker** | `>= 20.10` | [docker.com](https://www.docker.com/get-started) (opcional) |

### Instalação Rápida

#### 1. Clone o Repositório

```bash
git clone https://github.com/cpqd/zkp-lab.git
cd zkp-lab
```

#### 2. Configure o Ambiente Noir

```bash
# Instalar Nargo
curl -L https://raw.githubusercontent.com/noir-lang/noirup/main/install | bash
noirup

# Verificar instalação
nargo --version
```

#### 3. Configure Python

```bash
# Criar ambiente virtual
python -m venv venv

# Ativar ambiente
source venv/bin/activate  # Linux/Mac
# venv\Scripts\activate   # Windows

# Instalar dependências
pip install -r requirements.txt
```

#### 4. Instale Dependências Node.js

```bash
npm install
```

### Verificação da Instalação

Execute os testes para garantir que tudo está funcionando:

```bash
# Testar circuitos Noir
cd circuits/noir/age-verification
nargo test

# Testar contratos
cd ../../contracts/ethereum
npm test

# Executar suite completa
npm run test:all
```

Se todos os testes passarem, você está pronto! ✅

---

## 💡 Exemplos de Uso

### 🎂 Exemplo 1: Prova de Idade (Básico)

Prove que você tem 18+ anos sem revelar sua idade exata.

**Circuito (`circuits/noir/zkp_verificador_idade/src/main.nr`):**
```rust
pub fn main(idade: Field, idade_min: pub Field) {
    
    // Cast nos Fields para u8 antes de comparar
    assert(idade as u8 >= idade_min as u8, "idade deve ser maior do que 18 anos");
}

```

**Executar:**
```bash
cd circuits/noir/zkp_verificaodr_idade
nargo check
nargo compile
nargo execute
nargo test
nargo test --show-output
```

**[📖 Ver tutorial completo →](examples/02-age-verification/)**

---

### 🗳️ Exemplo 2: Sistema de Votação Privada 

Implementação de votação onde votos são privados mas o resultado é público e verificável.

**Características:**
- Anonimato total dos votantes
- Impossibilidade de voto duplo
- Verificação pública do resultado
- Resistente a coerção

**[📖 Ver tutorial completo →](examples/03-private-voting/)**

---
## 🤝 Contribuindo
Contribuições são o coração deste projeto ! Seja você um pesquisador, desenvolvedor ou entusiasta de criptografia, há várias formas de contribuir.

### Como Contribuir

1. **🍴 Fork o Projeto**
   ```bash
   git clone https://github.com/seu-usuario/zkp-lab.git
   ```

2. **🌿 Crie uma Branch**
   ```bash
   git checkout -b feature/MinhaContribuicao
   ```

3. **✍️ Faça suas Alterações**
   - Siga os padrões de código
   - Adicione testes
   - Atualize a documentação

4. **✅ Commit Semântico**
   ```bash
   git commit -m 'feat: adiciona novo circuito de range proof'
   ```

5. **📤 Push e Pull Request**
   ```bash
   git push origin feature/MinhaContribuicao
   ```

### Áreas de Contribuição

- 🧩 **Novos Circuitos**: Implemente novos casos de uso
- 🔒 **Segurança**: Auditorias e melhorias de segurança
- 📚 **Documentação**: Tutoriais, guias e tradução
- 🧪 **Testes**: Aumente a cobertura de testes
- 🐛 **Bug Fixes**: Corrija problemas existentes
- 💡 **Research**: Publique papers e análises

### Padrões de Commit
- `feat`: Nova funcionalidade
- `fix`: Correção de bug
- `docs`: Documentação
- `test`: Testes
- `refactor`: Refatoração
- `perf`: Performance
- `chore`: Manutenção

**[📖 Leia o guia completo →](CONTRIBUTING.md)**

---

## 🗓️ Roadmap

### ✅ Q4 2024 (Concluído)

- [x] Estruturação inicial do repositório
- [x] Implementação de circuitos básicos em Noir
- [x] Configuração de CI/CD
- [x] Documentação inicial

### 🚧 Q1 2025 (Em Andamento)

- [x] Circuitos intermediários (Merkle trees, range proofs)
- [ ] Integração com Ethereum testnet
- [ ] Sistema de benchmarking
- [ ] Tutoriais avançados

### 🎯 Q2 2025

- [ ] Biblioteca de circuitos reutilizáveis
- [ ] Framework de testes automatizados
- [ ] Integração com zkSync
- [ ] Implementação de criptografia pós-quântica
- [ ] Primeira publicação científica

### 🚀 Q3 2025

- [ ] Aplicações DeFi com privacidade
- [ ] Ferramentas de auditoria de circuitos
- [ ] Suporte a Halo2 e Plonky2
- [ ] Workshop e treinamentos

### 🌟 Q4 2025

- [ ] Casos de uso em produção
- [ ] Parcerias com indústria
- [ ] Contribuições para projetos open-source
- [ ] Participação em conferências internacionais

**[📖 Ver roadmap detalhado →](ROADMAP.md)**

---
## 📄 Publicações

### Papers e Artigos

*Em breve: Nossa primeira publicação científica está em desenvolvimento.*

### Blog Posts

- [Começando com Noir: Seu Primeiro Circuito ZKP](blog/primeiro-circuito-noir.md)
- [Entendendo SNARKs vs STARKs](blog/snarks-vs-starks.md)
- [Privacidade em Blockchain: O Papel das ZKPs](blog/privacidade-blockchain.md)

---
### Blog Posts

- [Começando com Noir: Seu Primeiro Circuito ZKP](blog/primeiro-circuito-noir.md)
- [Entendendo SNARKs vs STARKs](blog/snarks-vs-starks.md)
- [Privacidade em Blockchain: O Papel das ZKPs](blog/privacidade-blockchain.md)

---
## 📚 Referências e Estudos

- 📘 *Criptografia e Segurança de Redes* — William Stallings  
- 📗 *Serious Cryptography* — Jean-Philippe Aumasson  
- 📙 *Mastering Blockchain* — Imran Bashir  
- 🌐 Documentações:  
  [Noir Lang](https://noir-lang.org/) · [ZKProof.org](https://zkproof.org/) · [Hyperledger Fabric](https://hyperledger.org/use/fabric)

---
## 📄 Licença

Este projeto está licenciado sob a **Licença MIT** - veja o arquivo [LICENSE](LICENSE) para detalhes completos.

### Resumo da Licença

- ✅ Uso comercial
- ✅ Modificação
- ✅ Distribuição
- ✅ Uso privado
- ⚠️ Limitação de responsabilidade
- ⚠️ Sem garantias

---

## 👥 Equipe

<table>
  <tr>
    <td align="center">
      <sub><b>Luiz Fernando Pereira</b></sub><br>
      <sub>🔐 Criptografia & ZKP</sub><br>
      <sub>🌐 Blockchain Integration</sub><br>
      <sub>📜 Smart Contracts</sub><br> 
      <a href="">Github link</a>
      <a href="">Linkedin lind</a>
    </td>
    <td align="center">
      <sub><b>Monique Robatino</b></sub><br>
      <sub>🔐 Criptografia & ZKP</sub><br>
      <sub>🌐 Blockchain Integration</sub><br>
      <sub>📜 Smart Contracts</sub><br> 
      <a href="">Github link</a>
      <a href="">Linkedin lind</a>
    </td>
  </tr>
</table>

### Contribuidores

Agradecemos a todos que contribuíram para este projeto

### Orientação Institucional

**CPQD - Centro de Pesquisa e Desenvolvimento em Telecomunicações**  
*Residência Tecnológica em Criptografia Aplicada e Blockchain*

**Coordenação**: Alexandra Braga Mello
**Supervisão Técnica**: Antonio Mateus de Sousa

---

## 📚 Recursos Adicionais

### Documentação Oficial

- [📖 Documentação Noir](https://noir-lang.org/docs)
- [📖 Circom Documentation](https://docs.circom.io/)
- [📖 Halo2 Book](https://zcash.github.io/halo2/)

### Cursos e Tutoriais

- [🎓 ZK Whiteboard Sessions](https://zkhack.dev/whiteboard/)
- [🎓 ZK Learning Resources](https://www.zkdocs.com/)
- [🎓 Awesome Zero Knowledge](https://github.com/matter-labs/awesome-zero-knowledge-proofs)

### Comunidades

- [💬 ZK Research Forum](https://community.zkproof.org/)
- [💬 Noir Discord](https://discord.gg/noir)
- [💬 Ethereum R&D Discord](https://discord.gg/ethereum-r-and-d)

### Papers Fundamentais

1. **"Why and How zk-SNARK Works"** - Maksym Petkus
2. **"Recursive Proof Composition"** - Alessandro Chiesa et al.
3. **"Plonk: Permutations over Lagrange-bases"** - Gabizon, Williamson, Ciobotaru

---

## 🏆 Reconhecimentos

Agradecemos às seguintes organizações e projetos:

- **Noir Team** pela excelente linguagem e ferramentas
- **Ethereum Foundation** pelo suporte à pesquisa ZK
- **CPQD** pela infraestrutura e orientação
- **Comunidade Open Source** pelas contribuições valiosas

---

## 📈 Estatísticas do Projeto

<div align="center">

![GitHub stars](https://img.shields.io/github/stars/cpqd/zkp-lab-cpqd?style=social)
![GitHub forks](https://img.shields.io/github/forks/cpqd/zkp-lab-cpqd?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/cpqd/zkp-lab-cpqd?style=social)

![GitHub commit activity](https://img.shields.io/github/commit-activity/m/cpqd/zkp-lab-cpqd)
![GitHub last commit](https://img.shields.io/github/last-commit/cpqd/zkp-lab-cpqd)
![GitHub contributors](https://img.shields.io/github/contributors/cpqd/zkp-lab-cpqd)

</div>

---

<div align="center">

**Desenvolvido com 🔐 pela equipe ZKP Lab**

⭐ **Se este projeto foi útil, considere dar uma estrela!**

*Privacidade é um direito, não um privilégio.*

</div>

[def]: #roadmap
