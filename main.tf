
resource "docker_image" "ghost_image" {
   name = "${var.image_name}"
}

# Start the Ghost Container

resource "docker_container" "ghost_container" {
   name = "${var.container_name}"
   image = "${docker_image.ghost_image.latest}"
   
    ports  {
    internal = "2368"
    external = "${var.ext_port}"
  }
}

provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""
}
