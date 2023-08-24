provider "aws" {
  region = "ap-northeast-1" # 도쿄 리전
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "terraformVPC"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my-igw"
  }
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1a" # 도쿄 리전 A 존
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1c" # 도쿄 리전 C 존
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-c"
  }
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-northeast-1a" # 도쿄 리전 A 존
  tags = {
    Name = "private-subnet-a"
  }
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "ap-northeast-1c" # 도쿄 리전 C 존
  tags = {
    Name = "private-subnet-c"
  }
}