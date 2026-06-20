terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

resource "local_file" "app_config_dev" {
  filename = "/output/config-dev.txt"
  content  = <<-EOT
    Ambiente: dev
    Projeto: fiap-gitops
    Team: plataforma
    Owner: parpinelli16
    Versao: 1.0.0
  EOT
}

resource "local_file" "readme_dev" {
  filename = "/output/readme-dev.txt"
  content  = "Infraestrutura DEV provisionada via Terraform + GitOps"
}
