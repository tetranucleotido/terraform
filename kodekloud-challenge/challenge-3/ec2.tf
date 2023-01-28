resource "aws_instance" "citadel" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name = "citadel"
    user_data = file("/root/terraform-challenges/project-citadel/install-nginx.sh")
}
