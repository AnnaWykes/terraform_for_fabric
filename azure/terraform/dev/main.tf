

terraform {
  backend "azurerm" {
    resource_group_name   = "rg_terraform_for_fabric_01"
    storage_account_name  = "saterraformforfabric02"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}

module "resource_groups" {
  source = "../modules/resource_groups" 
}

module "storage_accounts" {
  source = "../modules/storage_accounts" 
  resource_group_name = "${module.resource_groups.resource_group_name}"
  resource_group_location = "${module.resource_groups.resource_group_location}"
  depends_on = [
    module.resource_groups
  ]
}

module "virtual_machine" {
  source = "../modules/vm" 
  vm_name = "vm_name"
  resource_group_name = "${module.resource_groups.resource_group_name}"
  resource_group_location = "${module.resource_groups.resource_group_location}"
  depends_on = [
    module.resource_groups
  ]
}

#terraform plan -out=plan.out
#terraform show -json plan.out > plan.json
#terraform graph | dot -Tsvg > graph.svg
#$env:ARM_ACCESS_KEY=
#terraform apply -destroy
#terraform force-unlock