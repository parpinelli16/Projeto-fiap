# Arquitetura GitOps - FIAP

## Fluxo GitOps

Developer → Pull Request → CI Pipeline → Merge → Apply Infraestrutura

|

┌──────────┴──────────┐

│  Validações CI       │

│  - terraform fmt     │

│  - terraform validate│

│  - checkov (segurança│

## Ferramentas utilizadas

| Ferramenta | Função |
|---|---|
| Terraform | Provisionamento de infraestrutura |
| LocalStack | Simula AWS localmente (sem custo) |
| GitHub Actions | Pipeline CI/CD |
| Git (GitHub) | Versionamento e controle de PR |
| Checkov | Análise de segurança do código IaC |

## Ambientes

- **dev**: ambiente de desenvolvimento, bucket `app-dev-fiap-bucket`
- **hml**: ambiente de homologação, bucket `app-hml-fiap-bucket`

## Fluxo de mudança

1. Desenvolvedor cria branch e faz alteração no código Terraform
2. Abre Pull Request para `main`
3. Pipeline CI valida sintaxe, formato e segurança
4. Se tudo passar, merge é permitido
5. Infraestrutura é aplicada via `terraform apply`