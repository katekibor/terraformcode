resource "aws_lightsail_instance" "example_instance" {
  name              = "example-instance"
  availability_zone = "us-east-1"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "micro_2_0"

  user_data = <<-EOF
              #!/bin/bash
              echo "<h1>This Server is created using Terraform </h1>" | sudo tee /var/www/html/index.html
              EOF

  key_pair_name = "your-key-pair-name"
}

output "public_ip" {
  value = aws_lightsail_instance.example_instance.public_ip_address
}
