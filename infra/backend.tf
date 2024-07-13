terraform {
  backend "s3" {
    bucket = "teraform-tfstate"
    key    = "github.tfstate"
    region = "us-east-1"
  }
}
