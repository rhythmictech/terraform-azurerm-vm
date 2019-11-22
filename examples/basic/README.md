# basic example
A basic example for this repository

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Moniker to apply to all resources in the module | string | n/a | yes |
| resource\_group\_name | Resource Group for bastion server | string | n/a | yes |
| subnet\_name | Subnet for bastion server | string | n/a | yes |
| vnet\_name | VNET containing subnet for bastion server | string | n/a | yes |
| assign\_public\_ip | If true then assigns a public IP to the VM | bool | `"false"` | no |
| env | Environment to tag resources with | string | `"default"` | no |
| location | Azure Location for Resources | string | `"eastus"` | no |
| private\_ip\_address\_allocation | Static or Dynamic | string | `"Static"` | no |
| public\_ip\_allocation\_method | Static or Dynamic | string | `"Static"` | no |
| ssh\_key | Optional SSH key for VM | string | `""` | no |
| storage\_image\_reference | storage_image_reference to specify VM image | map(string) | `{ "offer": "UbuntuServer", "publisher": "Canonical", "sku": "16.04-LTS", "version": "latest" }` | no |
| tags | User-Defined tags | map(string) | `{}` | no |
| vm\_size | VM size for bastion server, see docs.microsoft.com/en-us/azure/virtual-machines/linux/sizes-general | string | `"Standard_DS1_v2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| nic | nic resource object |
| ssh\_key | ssh private key to reach server |
| vm | vm resource object |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
