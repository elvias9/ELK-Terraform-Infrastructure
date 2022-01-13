# INTERNET GATEWAY ROUTE TABLE FOR PUBLIC NETWORK
resource "aws_route_table" "public_to_internet_rt" {
    vpc_id = aws_vpc.main_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
        }
        tags = {
            Name = "internet-gateway-route-table"
            }
}

# NAT GATEWAY ROUTE TABLE FOR PRIVATE GATEWAY
resource "aws_route_table" "public_subnet_rt" {
    vpc_id = aws_vpc.main_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_a.id
        }
        tags = {
            Name = "public-rt"
            }
}

# ROUTE TABLE ASSOCIATION TO SUBNET PUBLIC A
resource "aws_route_table_association" "igw_for_public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_to_internet_rt.id
}

# RT ASSOCIATION TO SUBNET PRIVATE A FOR LOGSTASH AND ELASTICSEARCH
resource "aws_route_table_association" "private_rt_for_L_E" {
    subnet_id      = aws_subnet.private_a.id
    route_table_id = aws_route_table.public_subnet_rt.id
}

# RT ASSOCIATION TO SUBNET PRIVATE B FOR TESTING
resource "aws_route_table_association" "private_rt_for_test" {
    subnet_id      = aws_subnet.private_b.id
    route_table_id = aws_route_table.public_subnet_rt.id
} 