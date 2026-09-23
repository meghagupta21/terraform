
output "publicip" {
  value = aws_instance.ec2instance.public_ip


}

output "privateip" {
  value = aws_instance.ec2instance.private_ip
  //sensitive = true
}