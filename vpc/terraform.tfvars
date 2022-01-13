# VPC
vpc_cidr = "10.0.0.0/16"
vpc_name = "ELK-Stack-VPC"
region = "eu-west-1"

# INTERNET GATEWAY
internet_gw_name = "ELK-Internet-Gateway"

# Key Pair
keypair_name = "elk-key"

# SUBNET
# PUBLIC 
public_cidr_a = "10.10.0.0/24"
public_name = "Kabana-Public-A"

# PRIVATE
private_cidr_a = "10.10.2.0/24"
private_cidr_b = "10.10.4.0/24"
