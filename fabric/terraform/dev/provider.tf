# We strongly recommend using the required_providers block to set the Fabric Provider source and version being used
terraform {
  required_version = ">= 1.8, < 2.0"
  required_providers {
    fabric = {
      source  = "microsoft/fabric"
      version = "1.3.0"
    }
  }
}

# # Configure the Microsoft Fabric Terraform Provider
provider "fabric" {
    # Using Azure CLI authentication instead of service principal
    # client_id       = var.client_id
    # client_secret   = var.client_secret
    # tenant_id       = var.tenant_id
    
    # Use Azure CLI authentication
    use_cli = true
}

#az login --allow-no-subscriptions --tenant 679ed0b9-425d-45ef-b209-90449470c549 --scope api://f75af6d3-891a-4395-9fed-c7c5cbcb04f8/.default

 