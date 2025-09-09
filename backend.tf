terraform {
  backend "s3" {
    bucket         = "awsnetworktrainingjmccoy"
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "awsnetworktrainingjmccoy-locks"
    encrypt        = true
  }
}

