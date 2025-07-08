# # Workspace with Capacity and Identity
data "fabric_capacity" "drumfishfabricdemo" {
  display_name = "drumfishfabricdemo"
}

resource "fabric_workspace" "example2" {
  display_name = "example2"
  description  = "Example Workspace 2"
  capacity_id  = data.fabric_capacity.drumfishfabricdemo.id
  # Temporarily removing identity configuration due to creation error
#   identity = {
#     type = "SystemAssigned"
#   }
}

# Example 1 - Notebook without definition
resource "fabric_notebook" "example" {
  display_name = "Demo Notebook Example"
  workspace_id = resource.fabric_workspace.example2.id
}

# Example 2 - Notebook with definition bootstrapping only
resource "fabric_notebook" "example_definition_bootstrap" {
  display_name              = "Demo Notebook Example with Definition Bootstrap"
  description               = "example with definition bootstrapping"
  workspace_id              = resource.fabric_workspace.example2.id
  definition_update_enabled = false
  format                    = "ipynb"
  definition = {
    "notebook-content.ipynb" = {
      source = "${local.path}/notebooks/notebook.ipynb.tmpl"
    }
  }
}

# Example 3 - Notebook with definition update when source or tokens changed
resource "fabric_notebook" "example_definition_update" {
  display_name = "Demo Example Notebook with Update"
  description  = "example with definition update when source or tokens changed"
  workspace_id = resource.fabric_workspace.example2.id
  format       = "ipynb"
  definition = {
    "notebook-content.ipynb" = {
      source = "${local.path}/notebooks/notebook.ipynb.tmpl"
      tokens = {
        "MESSAGE" = "World"
        "MyValue" = "Lorem Ipsum"
      }
    }
  }
}