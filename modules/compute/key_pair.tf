resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh" {
  key_name   = "key-ssh"
  public_key = tls_private_key.ssh.public_key_openssh
}

resource "local_file" "ssh_key" {
  filename = "./${aws_key_pair.ssh.key_name}.pem"
  content = tls_private_key.ssh.private_key_pem
}