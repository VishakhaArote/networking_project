terraform {
  backend "s3" {
    bucket         = "vishakha.terraform"    
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraformlock"                   
    encrypt        = true
  }
}
