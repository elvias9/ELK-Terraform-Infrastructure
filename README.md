# Team-1---Terraform-Infrastructure
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.71.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kibana-network"></a> [kibana-network](#module\_kibana-network) | ./vpc | n/a |
| <a name="module_my-network"></a> [my-network](#module\_my-network) | ./vpc | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./vpc | n/a |
| <a name="module_network_elasticsearch"></a> [network\_elasticsearch](#module\_network\_elasticsearch) | ./vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_instance.apache](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.elasticsearch_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.kibana](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.logstash](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.syslog](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.demo_servers_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.kibana_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.my_app_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.private_elasticsearch_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.demo_server_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elasticsearch_server_ip"></a> [elasticsearch\_server\_ip](#output\_elasticsearch\_server\_ip) | n/a |
<!-- END_TF_DOCS -->