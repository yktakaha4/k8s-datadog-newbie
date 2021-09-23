resource "aws_ecr_repository" "djangogirls" {
  name = "djangogirls"
}

resource "aws_ecr_lifecycle_policy" "djangogirls" {
  repository = aws_ecr_repository.djangogirls.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep last 1 images",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}
