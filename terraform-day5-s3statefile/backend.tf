terraform {
  backend "s3" {
    bucket = "terraform-statefile-430643634962"
    key    = "terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true 
  }
}