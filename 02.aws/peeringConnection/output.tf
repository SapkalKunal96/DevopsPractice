output "west-region-public" {
  value = aws_instance.db.public_ip
}

output "west-region-private" {
  value = aws_instance.db.private_ip
}

output "east-region-public" {
  value = aws_instance.web.public_ip

}

output "east-region-private" {
  value = aws_instance.web.private_ip

}