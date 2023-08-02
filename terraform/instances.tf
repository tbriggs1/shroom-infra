resource "aws_instance" "web" {
  ami           = "ami-0eb260c4d5475b901"
  instance_type = "t3.micro"
  key_name      = "tom"

  subnet_id              = aws_subnet.main_public_1.id
  vpc_security_group_ids = ["${aws_security_group.shroom.id}"]

  tags = {
    Name = "${terraform.workspace} Web Server"
  }

  provisioner "remote-exec" {
    inline = [
        "sudo su -",
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "echo 'Hello World' > /var/www/html/index.html"
    ]
  }

  connection {
    user        = "ubuntu"
    private_key = file(var.key_path)
    host        = self.public_dns
  }

  depends_on = [aws_instance.web]
}