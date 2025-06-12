provider "docker" {}

resource "local_file" "r_name" {
  filename = "/home/ubuntu/terraform-practice/demo.txt"
  content  = <<EOF
Hello! World. This is a file created with tf/terraform
This is new text in this file and created by terraform
EOF
}

resource "docker_image" "nginx_img" {
  name = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx-ctr" {
  name = "nginx-conatiner"
  image = docker_img.nginx_img.name
  ports {
    internal = 80 
    external = 80
  }
}