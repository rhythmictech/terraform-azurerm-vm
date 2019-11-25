# terraform-azurerm-vm
[![](https://github.com/rhythmictech/terraform-azurerm-vm/workflows/pre-commit-check/badge.svg)](https://github.com/rhythmictech/terraform-azurerm-vm/actions)

linux VM on Azure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| assign\_public\_ip | If true then assigns a public IP to the VM | bool | `"false"` | no |
| custom\_data | Custom Data to provide VM via Azure metadata | string | `""` | no |
| env | Environment to tag resources with | string | `"default"` | no |
| location | Azure Location for Resources | string | `"eastus"` | no |
| name | Moniker to apply to all resources in the module | string | n/a | yes |
| private\_ip\_address\_allocation | Static or Dynamic | string | `"Static"` | no |
| public\_ip\_allocation\_method | Static or Dynamic | string | `"Static"` | no |
| resource\_group\_name | Resource Group for bastion server | string | n/a | yes |
| ssh\_key | Optional SSH key for VM | string | `""` | no |
| storage\_image\_reference | storage_image_reference to specify VM image | map(string) | `{ "offer": "UbuntuServer", "publisher": "Canonical", "sku": "16.04-LTS", "version": "latest" }` | no |
| subnet\_name | Subnet for bastion server | string | n/a | yes |
| tags | User-Defined tags | map(string) | `{}` | no |
| vm\_size | VM size for bastion server, see docs.microsoft.com/en-us/azure/virtual-machines/linux/sizes-general | string | `"Standard_DS1_v2"` | no |
| vnet\_name | VNET containing subnet for bastion server | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| nic | nic resource object |
| ssh\_key | ssh private key to reach server |
| vm | vm resource object |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Acknowledgements
Thank you to @cytopia for the `Makefile` which allows us to generate the documentation.
See https://github.com/cytopia/docker-terraform-docs
