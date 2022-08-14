resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public-subnet[count.index]
  availability_zone = var.availability_zone[count.index]
  count             = length(var.public-subnet)
  tags = {
    "Name" = "public-subnet-${count.index}"
  }
}