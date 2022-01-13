module "my-network" {
  source = "./vpc"
  
  vpc_cidr         = "10.10.0.0/16"
  region           = "eu-west-1"
  vpc_name         = "ELK-Stack-VPC"
  internet_gw_name = "team1-new-INT-GW"
  public_cidr_a    = "10.10.1.0/24"
  private_cidr_a = "10.10.2.0/24"
  private_cidr_b = "10.10.3.0/24"
  public_name = "Kabana-Public-A"
}

resource "aws_security_group" "my_app_sg" {
  name        = "my_app_sg"
  description = "Allow access to my Server"
  vpc_id      = module.my-network.my_vpc_id

# INBOUND RULES
  ingress {
    description      = "SSH from my mac"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["31.72.40.251/32"]
  }
  egress {
      description = "Allow access to the world"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]    
  }
  tags = {
    Name = "my_app_sg"
  }
}

#EC2
resource "aws_instance" "logstash" {
    ami = "ami-07d8796a2b0f8d29c"
    instance_type = "t2.medium"
    key_name = "Team1KeyPair"
    subnet_id = module.my-network.private_subnet_a_id
    vpc_security_group_ids = [aws_security_group.my_app_sg.id]

  tags = {
    Name = "Logstash"
 }
}