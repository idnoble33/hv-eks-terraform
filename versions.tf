terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.99.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25.2"  
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.13.1"
    }
     aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


