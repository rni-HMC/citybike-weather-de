terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}
resource "aws_instance" "app_server" {
  ami                    = "ami-023e152801ee4846a"
  instance_type          = "t2.micro"
  key_name               = "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name = "CityBikeWeatherAppServerInstance"
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("/home/richard/Projects/CityBikeWeather/infrastructure/aws_key")
    timeout     = "4m"
  }
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }
  ]
}


resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDaH3M8Zj5wIgzkAfqEBsG053t4Sujt3FHmi7rlb7DXQmnlANmPeXL4QK15xHJZWjhynyKb/7Al65I8Elr86qMY6zXFLN0+Me08lkmNexbXoDOhkXRld3JE5G6hZlbJZQFJen8KaKqDe8hGbHaXNgpS0GGB3yLRBe+QpTduD4whB3QKvYvyE5OVkUmUSmwPuswdCGdhAx+Bkyt245mKFVzwtIsvGD3DFw6pqcSXTv+EnLADcvLbUCvh2/b1ISFJX7ajhBkvJw+AxFo5KJKo9dQ05QaL5OcEK3oLgvndodog6BTg8jU3+fzshqOzMiirTKa6r6ih4hokLEwL6dGDjOPX richard@l-richni-02"
}
