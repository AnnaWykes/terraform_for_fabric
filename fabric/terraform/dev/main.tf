

terraform {
  backend "azurerm" {
    resource_group_name   = "rg_terraform_for_fabric_01"
    storage_account_name  = "saterraformforfabric02"
    container_name        = "tfstate"
    key                   = "fabricterraform.tfstate"
  }
}

module "demo_fabric" {
  source = "../modules/demo_fabric" 
}



#terraform plan -out=plan.out
#terraform show -json plan.out > plan.json
#terraform graph | dot -Tsvg > graph.svg
#$env:ARM_ACCESS_KEY=
#terraform apply -destroy
#terraform force-unlock