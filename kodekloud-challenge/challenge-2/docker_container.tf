# Start a container
resource "docker_container" "php-httpd" {
  name  = "webserver"
  image = "php-httpd:challenge"
  hostname = "php-httpd"

  networks_advanced {
    name = "my_network"
  }
  ports {
    internal = 80
    external = 80
    ip       = "0.0.0.0"
  }
  mounts {
    source = "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
    target = "/var/www/html"
    type   = "bind"
  }
  labels {
    challenge = "second"
  }
  }