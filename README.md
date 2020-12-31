## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| azuredevops | >= 0.1.0 |

## Providers

| Name | Version |
|------|---------|
| azuredevops | >= 0.1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| github\_pat | The Personal Access Token for Github. | `string` | n/a | yes |
| github\_serviceendpoint\_description | GitHub Service Endpoint description. | `string` | `"Managed by Terraform"` | no |
| github\_serviceendpoint\_name | GitHub Service Endpoint name. | `string` | n/a | yes |
| proj\_description | Azure DevOps Project description. | `string` | n/a | yes |
| proj\_features | Project features. | `map(string)` | <pre>{<br>  "artifacts": "disabled",<br>  "boards": "disabled",<br>  "pipelines": "enabled",<br>  "repositories": "enabled",<br>  "testplans": "disabled"<br>}</pre> | no |
| proj\_name | Azure DevOps Project name. | `string` | n/a | yes |
| proj\_vcs | Project Version Control. | `string` | `"Git"` | no |
| proj\_visibility | Project visibility. | `string` | `"private"` | no |
| proj\_wi\_template | Project Work Item template. | `string` | `"Agile"` | no |
| vg\_allow\_access | Boolean that indicate if this variable group is shared by all pipelines of this project. | `bool` | `false` | no |
| vg\_description | The description of the Variable Group. | `string` | n/a | yes |
| vg\_name | The name of the Variable Group. | `string` | n/a | yes |
| vg\_variables | One or more variable blocks as documented below.<br><br>A variable block supports the following:<br><br>  * name - (Required) The key value used for the variable. Must be unique within the Variable Group.<br>  * value - (Optional) The value of the variable. If omitted, it will default to empty string.<br>  * is\_secret - (Optional) A boolean flag describing if the variable value is sensitive. Defaults to false. | <pre>list(object({<br>    name      = string<br>    value     = string<br>    is_secret = bool<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| ghsc\_name | n/a |
| proj\_id | n/a |
| proj\_name | n/a |
| vg\_id | n/a |
| vg\_name | n/a |
