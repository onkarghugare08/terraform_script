# Latest Amazon Linux 2 AMI for the chosen region
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "main" {
  count                       = 2
    ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.main.id]
  associate_public_ip_address = true
  key_name                    = "${var.key_name}"

   root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }


  # Task 6: replace the instance by creating the new one first
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "TerraWeek-Server"
  }
}