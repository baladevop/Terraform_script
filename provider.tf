provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

variable "poc" {
    
    
}

resource "aws_s3_bucket" "mys3"{
 count = "${var.poc == "true" ? 1:0}"
 bucket = "poc4_1"
 acl    = "private"
 
 tags = {
  name = "poc4_1"
  Environment = "Dev"
 }
}

resource "aws_instance" "instance2" {
  count = "${var.poc == "false" ? 1:0}"
  ami           = "ami-0ed9277fb7eb570c9" 
  instance_type = "t2.micro"
  tags = {
     Name = "Conditional"
  }
}
