resource "aws_ecr_repository" "harikumar" {
  name                 = "harikumar-atc-xyz"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}
