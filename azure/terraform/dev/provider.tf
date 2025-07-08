
# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
    subscription_id = var.subscription_id 
    client_id       = var.client_id
    client_secret   = var.client_secret
    tenant_id       = var.tenant_id
  }

  # az login --service-principal --username "6ba789bd-02bf-46a5-9437-505491c1bf07" --password "bqs8Q~q~XtBhgLIHgeNc3PW5TuNmKKFRr4kAZbUL" --tenant "5a817c6b-586d-4c36-ae1f-45feb48cbf2d"