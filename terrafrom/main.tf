data "aws_ami" "app_ami" {
    most_recent = true

    filter {
        name   = "name"
        values = ["bitnami-tomcat-*-x86-64-hvm-ebs-nami"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["679593333241"] 
}

resource "aws_instance" "web" {
    ami  = data.aws_ami.app_ami.id
    instance_type = var.instance_type

    tags = {
        Name = "hello-world-terraform"
    }
}