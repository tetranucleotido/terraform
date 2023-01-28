#Create keys with ssh-keygen -q -f keys/aws_terraform -C aws_terraform_ssh_key -N ''
resource "aws_key_pair" "citadel-key" {
    key_name = "citadel"
    public_key = file("/root/terraform-challenges/project-citadel/.ssh/ec2-connect-key.pub")
}