module "kibana-network" {
  source = "./vpc"
  
  vpc_cidr         = "10.10.0.0/16"
  region           = "eu-west-1"
  vpc_name         = "ELK-Stack-VPC"
  internet_gw_name = "team1-new-INT-GW"
  public_cidr_a    = "10.10.1.0/24"
  public_name = "Kabana-Public-A"
  private_cidr_a = "10.10.2.0/24"
  private_cidr_b = "10.10.3.0/24"
}

resource "aws_security_group" "kibana_sg" {
  name        = "kibana_sg"
  description = "Allow access to my Kibana Server"
  vpc_id      = module.kibana-network.my_vpc_id

  # INBOUND RULES
  # Ashley
  ingress {
    description      = "SSH - Ashley"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["81.106.56.65/32"]
  }

  ingress {
    description      = "Kibana server - Ashley"
    from_port        = 5601
    to_port          = 5601
    protocol         = "tcp"
    cidr_blocks      = ["81.106.56.65/32"]
  }
  # Shane
  ingress {
    description      = "SSH - Shane"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["31.48.104.245/32"]
  }

  ingress {
    description      = "Kibana server - Shane"
    from_port        = 5601
    to_port          = 5601
    protocol         = "tcp"
    cidr_blocks      = ["31.48.104.245/32"]
  }
  # Elvia
  ingress {
    description      = "SSH - Elvia"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["158.181.78.253/32"]
  }

  ingress {
    description      = "Kibana server - Elvia"
    from_port        = 5601
    to_port          = 5601
    protocol         = "tcp"
    cidr_blocks      = ["158.181.78.253/32"]
  }
  # Courtney
  ingress {
    description      = "SSH - Courtney"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["217.35.224.217/32"]
  }

  ingress {
    description      = "Kibana server - Courtney"
    from_port        = 5601
    to_port          = 5601
    protocol         = "tcp"
    cidr_blocks      = ["217.35.224.217/32"]
  }
  # Himat
  ingress {
    description      = "SSH - Himat"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["77.99.152.53/32"]
  }

  ingress {
    description      = "Kibana server - Himat"
    from_port        = 5601
    to_port          = 5601
    protocol         = "tcp"
    cidr_blocks      = ["77.99.152.53/32"]
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
    subnet_id = module.kibana-network.public_subnet_a_id
    vpc_security_group_ids = [ aws_security_group.kibana_sg.id ]

    tags = {
      Name = "Kibana"
    }
}
