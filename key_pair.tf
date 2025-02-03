resource "aws_key_pair" "harikumar" {
  key_name   = "harikumar"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = {
    Name = "harikumar"
  }
}