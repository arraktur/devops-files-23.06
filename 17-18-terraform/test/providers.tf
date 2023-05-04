terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }
  }


  
  # backend "kubernetes" {
  #   secret_suffix    = "state"
  #   config_path      = "~/.kube/config"
  # }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

data "terraform_remote_state" "wp-data" {
  backend = "kubernetes"
  config = {
    secret_suffix = "state"
    load_config_file = true
    config_path      = "~/.kube/config"
  }
}