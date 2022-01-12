resource "aws_security_group" "private_elasticsearch_sg" {
 #vpc_id      = module.network.my_vpc_id

  # INBOUND RULES
  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    /* put the private subnet cidr or ["0.0.0.0/0"] ???*/
    cidr_blocks = ["10.10.0.0/16"]
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    /* put the private subnet cidr */
    cidr_blocks = ["10.10.0.0/16"]
  }

  ingress {
    description = "elasticsearch port"
    from_port = 9200
    to_port = 9300
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  #OUTBOUND RULES

   egress {
    description = "allow HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
    description = "allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    /* put the vpc cidr block */
    cidr_blocks = ["10.200.0.0/16"]
  }


  # egress {
  #   description = "Allow access to the world"
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  tags = {
    Name = "private_server_sg"
  }
}


resource "aws_instance" "elasticsearch_server" {
  ami             = "ami-07d8796a2b0f8d29c" 
  # subnet_id       = module.network.private_subnet_a_id
  instance_type   = "t2.medium"
  key_name        = "Team1KeyPair"
  vpc_security_group_ids = [aws_security_group.private_elasticsearch_sg.id]
  tags            = { 
      Name = "elasticsearch-server" 
    }

}