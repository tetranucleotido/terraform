resource "aws_eip" "eip" {
  instance = aws_instance.citadel.id
  vpc      = true
  provisioner "local-exec" {
    command = "echo ${self.public_dns} >> /root/citadel_public_dns.txt"
  }
}


#Associate EIP with EC2 Instance
resource "aws_eip_association" "demo-eip-association" {
  instance_id   = aws_instance.citadel.id
  allocation_id = aws_eip.eip.id
}