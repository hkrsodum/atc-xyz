resource "aws_instance" "ec2" {
  ami                         = "ami-04b4f1a9cf54c11d0"
  instance_type               = "t2.micro"
  monitoring                  = true
  key_name                    = "ec2-key"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.harikumar-subnet-1.id
  vpc_security_group_ids      = [aws_security_group.harikumar-sg-inbound.id]

  user_data = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo echo "<h1>Welcome to Website of Harikumar</h1>" > /var/www/html/index.html
sudo systemctl restart nginx
EOF

  tags = {
    Name = "harikumar-ec2"
  }
}


output "IP_Adress" {
  description = "public_ip_address of the aws_instance"
  value       = aws_instance.ec2.public_ip
}
