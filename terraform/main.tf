provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "minecraft_sg" {
  name        = "minecraft_sg"
  description = "Allow Minecraft access"
  vpc_id      = "vpc-123456"  # Replace with your VPC ID

  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "minecraft" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with the AMI ID of your choice
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.minecraft_sg.name}"]

  tags = {
    Name = "MinecraftServer"
  }

  user_data = file("../setup.sh")

  lifecycle {
    create_before_destroy = true
  }
}

output "instance_public_ip" {
  value = aws_instance.minecraft.public_ip
}
