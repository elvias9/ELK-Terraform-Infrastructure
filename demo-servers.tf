module "network" {
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

resource "aws_security_group" "demo_servers_sg" {
  name        = "demo_servers_sg"
  description = "Allow access to my Demo Servers"
  vpc_id      = module.network.my_vpc_id

    # INBOUND RULES
  ingress {
    description      = "local SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["10.10.0.0/16"]
  }

  ingress {
    description      = "HTTP from open"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["10.10.0.0/16"]
  }

  # OUTBOUND RULES
  egress {
      description = "Allow access to world"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG for demo servers"
  }
}

data "aws_ami" "demo_server_ami" {
    owners = ["137112412989"]
    most_recent = true
    filter {
        name = "name"
        values = [ "amzn2-ami-kernel-*" ]
    }
}

resource "aws_instance" "syslog" {
    ami = data.aws_ami.demo_server_ami.id
    instance_type = "t2.micro"
    subnet_id = module.network.private_subnet_b_id
    vpc_security_group_ids = [ aws_security_group.demo_servers_sg.id ]

    tags = {
      Name = "Test Server Syslog"
    }
}

resource "aws_instance" "apache" {
    ami = data.aws_ami.demo_server_ami.id
    instance_type = "t2.micro"
    subnet_id = module.network.private_subnet_b_id
    vpc_security_group_ids = [ aws_security_group.demo_servers_sg.id ]

    user_data = <<-EOF
        #!/bin/bash
        yum update -y
        yum install -y httpd

        echo "<h1>Apache Demo Server</h1>" > /var/www/html/index.html

        systemctl start httpd
        systemctl enable httpd
        EOF

    tags = {
      Name = "Test Server Apache"
    }
}