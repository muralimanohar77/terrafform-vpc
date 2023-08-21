provider "aws" {
region= "ap-south-1"
access_key = "AKIA47CZU7AOGVEA4SUO"
secret_key = "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"
}

resource "aws_vpc" "one" {
tags = {
Name = "terra-vpc"
}
cidr_block = "30.0.0.0/16"
instance_tenancy = "default"
enable_dns_hostnames = "true"
}

resource "aws_subnet" "two" {
vpc_id = aws_vpc.one.id
tags = {
Name = "subnetterravpc-1"
}
availability_zone= "ap-south-1a"
cidr_block = "30.0.1.0/24"
}

resource "aws_internet_gateway" "three" {
tags = {
Name = "igmterravpc-1"
}
vpc_id = aws_vpc.one.id
}

resource "aws_route_table" "four" {
vpc_id = aws_vpc.one.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.three.id
}
tags = {
Name = "route-terrvpc-1"
}
}


