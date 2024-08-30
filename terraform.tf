provider "aws" {
    region = "ap-south-1"
}
#VPC
resource "aws_vpc" "my-vpc" {
    cidr_block ="10.0.0.0/24"
    tags ={
        Name="Terraform"
    } 
}
#Internet Gateway 
resource "aws_internet_gateway" "my-ig" {
    vpc_id = aws_vpc.my-vpc.id
    tags ={
        Name="TerraformIG"
    } 
}
#route Table
resource "aws_route_table" "my-rt" {
   vpc_id = aws_vpc.my-vpc.id
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "aws_internet_gateway.my-ig.id"
}
tags = {
  Name= "TerraformRT"
}
}
#Subnet
resource aws_subnet "my-sn" {
    vpc_id= aws_vpc.my-vpc.id
    map_public_ip_on_launch =false
    cidr_block="10.0.0.0/24"
tags = {
  Name= "TerraformSN"
}
}
#Security Group ports(22,80,443)
resource "aws_security_group" "my-sg" {
    name = "my-securitygroup"
    vpc_id = aws_vpc.my-vpc.id
    ingress {
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"] 
    }
    ingress  {
        from_port=80
        to_port=80
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"] 
    }
    ingress  {
        from_port=443
        to_port=443
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"] 
    }
}
#Network Interface setup/creation
resource "aws_network_interface" "my-ni" {
    subnet_id = aws_subnet.my-sn.id
    security_groups = [aws_security_group.my-sg.id]
    tags = {
      Name=  "terraformSN"
    }
}
#Elastic IP 
resource "aws_eip" "eip-ni" {
    vpc = true
    tags = {
      Name="My-EIP"
    }
}
resource "aws_eip_association" "eip-association" {
    allocation_id = aws_eip.eip-ni.id
    network_interface_id =aws_network_interface.my-ni.id
}
#ec2 setup
resource "aws_instance" "demo" {
    ami = "ami-0e86e20dae9224db8"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1b"
    key_name = "ubuntu"
    user_data = <<-EOF
    #!/bin/bash
    sudo apt install git -y
    EOF
    tags = {
      Name="terraformDemoInstance"
    }
    network_interface {
     device_index = 0
     network_interface_id = aws_network_interface.my-ni.id
}
}