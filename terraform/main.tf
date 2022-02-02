provider "aws" {
    region = "sa-east-1"  
}

resource "aws_instance" "homolog" {
    count = 2
    ami = "ami-032991827172bbd26"
    instance_type = "t2.micro"
    key_name = "terraform-homolog-aws-pessoal"
    tags = {
        Name = "hml${ count.index }"
    }
}