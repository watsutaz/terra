# Declare the data source
data "aws_availability_zones" "available" {}


# Define a vpc
resource "aws_vpc" "sinatra-app-vpc" {
  cidr_block = "${var.sinatra-app_network_cidr}"
  tags {
    Name = "${var.sinatra-app-vpc}"
  }
}

# Internet gateway for the public subnet
resource "aws_internet_gateway" "sinatra-app-internet-gateway" {
  vpc_id = "${aws_vpc.sinatra-app-vpc.id}"
  tags {
    Name = "sinatra-app-internet-gateway"
  }
}

# Public subnet 1
resource "aws_subnet" "sinatra-app-public-subnet-01" {
  vpc_id = "${aws_vpc.sinatra-app-vpc.id}"
  cidr_block = "${var.sinatra-app-public-subnet-01_cidr}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags {
    Name = "sinatra-app-public-subnet-01"
  }
}

# Routing table for public subnet 1
resource "aws_route_table" "sinatra-app-public-subnet-routing-table-01" {
  vpc_id = "${aws_vpc.sinatra-app-vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.sinatra-app-internet-gateway.id}"
  }
  tags {
    Name = "sinatra-app-public-subnet-routing-table-01"
  }
}

# Associate the routing table to public subnet 1
resource "aws_route_table_association" "sinatra-app-public-subnet-routing-table-01-association" {
  subnet_id = "${aws_subnet.sinatra-app-public-subnet-01.id}"
  route_table_id = "${aws_route_table.sinatra-app-public-subnet-routing-table-01.id}"
}

# ECS Instance Security group
resource "aws_security_group" "sinatra-app-public-security-group" {
  name = "sinatra-app-public-security-group"
  description = "Allows HTTP trafic"
  vpc_id = "${aws_vpc.sinatra-app-vpc.id}"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = [
      "${var.sinatra-app-public-subnet-01_cidr}",
    ]
  }

  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags {
    Name = "sinatra-app-public-security-group"
  }
}
