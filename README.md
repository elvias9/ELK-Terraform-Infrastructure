# Team-1---Terraform-Infrastructure

>__Team:__ Olga Lugai, Ashley Ritchie, Himat Varsani, Shane Frost, Elvia Sicuro, Courtney Bawuah

### Two repository created 
>1. Terraform Infrastructure:  __Repo: Team-1-Terraform-Infrastructure__
>2. Ansible - ELK Stack: __Repo: Team-1-ELK-Stack__

Development Branch - TERRAFORM
----------------------------
The development branch was created to merge all the individual repository into this single repository for testing the Terraform infrastructure

> #### FOLDER: .github/workflows:
***File:*** terraform-deployment.yml <br/>
The pipeline terraform setup and deployment for the main. infrastructure that enable automation testing using GitAction when pushed to Git.
<br/><br/>
> #### FOLDER: vpc:
***File:*** main.tf <br/>
Configure the resources for the VPC, Internet Gateway, Elastic IP, and the Public and Private Subnet
<br/><br/>
***File:*** output.tf <br/>
Outputs the ip addresses once deployed
<br/><br/>
***File:*** route_table.tf <br/>
Creating and configuring the inbound and outbound gateway so that communication is established between the subnets
<br/><br/>
***File:*** terraform.tfvars and variables.tf <br/>
Declaring the variables 
<br/><br/>

***File:*** backend.tf <br/>
Creating the backend, S3 bucket to store our Terraform state
<br/><br/>
***File:*** provider.tf <br/>
set our region to eu-west-1 --> Ireland
<br/><br/>
***File:*** demo-server.tf <br/>
setting up and configuring the security group including inbound and outcome rules for the demo server. Creating images using ubuntu images kernal
<br/><br/>
***File:*** elasticsearch.tf, kibana-ec2.tf, and logstash-ec2.tf  <br/>
EC2 setting up and configuring the security group including inbound and outcome rules for the EC2. Creating images using ubuntu images kernal and security group
<br/><br/>

<!-- BEGIN_TF_DOCS -->
## Region

eu-west-1

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.71.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network"></a> [network](#module\_network) | ./vpc | n/a |

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


<!-- END_TF_DOCS -->
