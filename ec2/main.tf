resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.private_subnet_ids, count.index)
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = false
  count         = var.instance_count
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1>Welcome to my Terraform 3-tier Architecture!</h1>" | sudo tee /var/www/html/index.html
            EOF

  tags = {
    Name = "AppServer-${count.index + 1}"
  }
}

