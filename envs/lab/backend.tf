terraform {
  backend "s3" {
    bucket       = "golbertops-tf-state-base"
    key          = "lab/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}