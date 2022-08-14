output "lb-dns" {
  value = aws_lb.lb.dns_name
}

output "private-key" {
  value = tls_private_key.ssh.private_key_pem
}

output "ec2-dns-name" {
  value = [aws_instance.host-wp[0].public_dns,aws_instance.host-wp[1].public_dns]
}