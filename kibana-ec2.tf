resource "aws_security_group" "kibana_sg" {
  name        = "kibana_sg"
  description = "Allow access to my Kibana Server"
  vpc_id      = module.network.my_vpc_id

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
    cidr_blocks      = ["158.181.77.37/32"]
  }

  ingress {
    description      = "Kibana server - Elvia"
    from_port        = 5601
    to_port          = 5601
    protocol         = "tcp"
    cidr_blocks      = ["158.181.77.37/32"]
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
    subnet_id = module.network.public_subnet_a_id
    vpc_security_group_ids = [ aws_security_group.kibana_sg.id ]

    tags = {
      Name = "Kibana"
    }
}