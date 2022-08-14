resource "aws_instance" "host-wp" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ssh.key_name
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.public-subnet[count.index].id
  security_groups             = [data.aws_security_group.ec2-sg.id]
  count                       = length(data.aws_subnet.public-subnet)
  tags = {
    "key" = "WordPress-${count.index}"
  }
}