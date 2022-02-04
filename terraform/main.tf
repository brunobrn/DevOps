provider "aws" {
    region = "sa-east-1"  
    access_key = ""
    secret_key = ""
}
resource "aws_instance" "homolog" {
    count = 3
    ami = "ami-032991827172bbd26"
    instance_type = "t2.micro"
    tags = {
        Name = "hml${ count.index }"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "hml4" {
    ami = "ami-032991827172bbd26"
    instance_type = "t2.micro"
    tags = {
        Name = "hml4"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
    depends_on = [aws_s3_bucket.dev4]
}

resource "aws_instance" "hml5" {
    ami = "ami-032991827172bbd26"
    instance_type = "t2.micro"
    tags = {
        Name = "hml5"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}
resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["179.187.215.103/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh"
  }
}


resource "aws_s3_bucket" "dev4" {
  bucket = "brunoaulalabs-dev4"
  acl    = "private"

  tags = {
    Name        = "brunoaulalabs-dev4"
  }
}
