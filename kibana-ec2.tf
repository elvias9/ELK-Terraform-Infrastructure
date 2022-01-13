module "network" {
  source = "/vpc"
  
  vpc_cidr         = "10.10.0.0/16"
  region           = "eu-west-1"
  vpc_name         = "ELK-Stack-VPC"
  internet_gw_name = "team1-new-INT-GW"
  public_cidr_a    = "10.10.1.0/24"
  private_cidr_a = "10.10.2.0/24"
  private_cidr_b = "10.10.3.0/24"
}

resource "aws_security_group" "kibana_sg" {
  name        = "kibana_sg"
  description = "Allow access to my Kibana Server"
  vpc_id      = module.network.my_vpc_id

  # INBOUND RULES
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP from internet"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Kibana server"
    from_port        = 5601
    to_port          = 5601
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  #OUTBOUND RULES
  egress {
      description = "Allow access to the world"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "kibana_sg"
  }
}

resource "aws_instance" "kibana" {
    ami = "ami-07d8796a2b0f8d29c"
    instance_type = "t2.medium"
    key_name = "Team1KeyPair"
    subnet_id = module.network.public_subnet_a_id
    vpc_security_group_ids = [ aws_security_group.kibana_sg.id ]

    tags = {
      Name = "Kibana"
    }
}