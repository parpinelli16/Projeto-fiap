# Projeto GitOps - FIAP

## Sobre
Pipeline GitOps para provisionamento de infraestrutura com Terraform e GitHub Actions.

## Estrutura

├── .github/workflows/ci.yml   # Pipeline CI
├── app/index.html             # Aplicação simples
├── docs/arquitetura.md        # Diagrama e decisões
├── Infra/
│   ├── dev/                   # Ambiente de desenvolvimento
│   └── hml/                   # Ambiente de homologação
└── README.md


## Como rodar localmente

### Pré-requisitos
- Terraform instalado
- LocalStack (Docker)

### Subir LocalStack
```bash
docker run --rm -d -p 4566:4566 localstack/localstack
```

### Aplicar infraestrutura DEV
```bash
cd Infra/dev
terraform init
terraform plan
terraform apply -auto-approve
```

### Verificar bucket criado
```bash
aws --endpoint-url=http://localhost:4566 s3 ls
```

### Destruir ambiente
```bash
terraform destroy -auto-approve
```

## Experimento de Drift
1. Aplique a infra: `terraform apply`
2. Delete o bucket manualmente: `aws --endpoint-url=http://localhost:4566 s3 rb s3://app-dev-fiap-bucket`
3. Rode `terraform plan` — ele detecta o drift
4. Rode `terraform apply` — reconcilia o estado

## Rollback
```bash
git log --oneline        # Ver versões anteriores
git revert HEAD          # Reverter último commit
# Pipeline CI valida e aplica a versão anterior
```