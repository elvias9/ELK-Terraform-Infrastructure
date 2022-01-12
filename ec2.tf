resource "aws_security_group" "public_sg" {
  name        = "my_app_sg"
  description = "Allow access to my Server"
  vpc_id      = module.network.my_vpc_id

    # INBOUND RULES
  ingress {
    description      = "local SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP from open"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
      description = "Allow access to the world"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public_sg"
  }
}

resource "aws_instance" "kibana" {
    ami = "ami-07d8796a2b0f8d29c"
    instance_type = var.instance_type
    key_name = "Team1KeyPair"
    subnet_id = module.network.public_subnet_a_id
    vpc_security_group_ids = [ aws_security_group.my_app_sg.id ]

    tags = {
      Name = "Kibana"
    }
}