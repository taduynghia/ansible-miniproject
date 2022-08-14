data "aws_subnet" "public-subnet" {
  count = 2
  filter {
    name   = "tag:Name"
    values = ["public-subnet-${count.index}"]
  }
}

data "aws_security_group" "ec2-sg" {
  filter {
    name   = "tag:Name"
    values = ["ec2-sg"]
  }
}

data "aws_security_group" "lb-sg" {
  filter {
    name   = "tag:Name"
    values = ["lb-sg"]
  }
}


data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc"]
  }
}