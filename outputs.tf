output "public-IP" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ec2.public_ip
}
# output "associate_public_ip_address" {
#   description = "This is the public IP address of the EC2 instance"
#   value       = aws_instance.ec2.associate_public_ip_address
# }
# output "private_ip_ec2" {
#   description = "This is the private IP address of the EC2 instance"
#   value       = aws_instance.ec2.private_ip

# }
# output "public_ip_ec2" {
#   description = "This is the public IP address of the EC2 instance"
#   value       = aws_instance.ec2.public_ip
# }
# output "name" {
#   description = "This is the name of the EC2 instance"
#   value       = aws_instance.ec2.tags.Name
# }
# output "instance_type" {
#   description = "This is the type of the EC2 instance"
#   value       = aws_instance.ec2.instance_type
# }
# output "ami" {
#   description = "This is the AMI of the EC2 instance"
#   value       = aws_instance.ec2.ami
# }
# output "subnet_id" {
#   description = "This is the subnet ID of the EC2 instance"
#   value       = aws_instance.ec2.subnet_id
# }
# output "monitoring" {
#   description = "This is the monitoring status of the EC2 instance"
#   value       = aws_instance.ec2.monitoring
# }
# output "key_name" {
#   description = "This is the key name of the EC2 instance"
#   value       = aws_instance.ec2.key_name
# }
# output "iam_instance_profile" {
#   description = "This is the IAM instance profile of the EC2 instance"
#   value       = aws_instance.ec2.iam_instance_profile
# }


# output "public_ip_slave" {
#   description = "This is the public IP address of the EC2 instance"
#   value       = aws_instance.slave.public_ip
# }
# output "private_ip_slave" {
#   description = "This is the private IP address of the EC2 instance"
#   value       = aws_instance.slave.private_ip
# }

# output "public_ip_slave2" {
#   description = "This is the public IP address of the EC2 instance"
#   value       = aws_instance.slave2.public_ip
# }
# output "private_ip_slave2" {
#   description = "This is the private IP address of the EC2 instance"
#   value       = aws_instance.slave2.private_ip
# }