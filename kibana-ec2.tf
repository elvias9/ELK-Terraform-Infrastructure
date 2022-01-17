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
    cidr_blocks      = ["10.10.0.0/16"]
  }

  ingress {
    description      = "Elasticsearch"
    from_port        = 9200
    to_port          = 9200
    protocol         = "tcp"
    cidr_blocks      = ["10.10.2.0/24"]
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