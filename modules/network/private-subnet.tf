resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private-subnet[count.index]
  availability_zone = var.availability_zone[count.index]
  count             = length(var.private-subnet)
  tags = {
    "Name" = "private-subnet-${count.index}"
  }
}