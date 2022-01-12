# VPC
variable "vpc_cidr" {
    description = "The CIDR of the VPC"
    type = string
}

variable "vpc_name" {
    description = "The name of the VPC"
    type = string
}

# REGION
variable "region" {
  description = "Default region for the VPC"
  type = string
}

# INTERNET GATEWAY
variable "internet_gw_name" {
  description = "The name of my Internet Gateway"
  type = string
}

#INSTANCE
variable "instance_type" {
  description = "The type of my first server"
  type = string
  default = "t2.medium"
}

# KEY PAIR
variable "keypair_name" {
  description = "The key pair name"
  type = string
}

# SUBNET
#PUBLIC SUBNET
variable "public_cidr_a" {
  description = "CIDR of the public Subnet for Kabana"
  type = string
}

variable "public_name" {
  description = "Public access to Kabana"
  type = string
}

#PRIVATE SUBNET
variable "private_cidr_a" {
  description = "CIDR of the private Subnet for Logstash and Elasticsearch"
  type = string
}

variable "private_cidr_b" {
  description = "CIDR of the private Subnet for testing and logs"
  type = string
}