terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

resource "local_file" "app_config_hml" {
  filename = "/output/config-hml.txt"
  content  = <<-EOT
    Ambiente: hml
    Projeto: fiap-gitops
    Team: plataforma
    Owner: parpinelli16
    Versao: 1.0.0
  EOT
}

resource "local_file" "readme_hml" {
  filename = "/output/readme-hml.txt"
  content  = "Infraestrutura HML provisionada via Terraform + GitOps"
}
