data "aws_subnet" "private-subnet" {
  count = 2
  filter {
    name   = "tag:Name"
    values = ["private-subnet-${count.index}"]
  }
}

data "aws_security_group" "db-sg" {
  filter {
    name   = "tag:Name"
    values = ["db-sg"]
  }
}