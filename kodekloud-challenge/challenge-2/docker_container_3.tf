# Start a container
resource "docker_container" "mariadb" {
  name  = "db"
  image = "mariadb:challenge"
  hostname = "db"
  env = ["MYSQL_ROOT_PASSWORD=1234", "MYSQL_DATABASE=simple-website"]

  networks_advanced {
    name = "my_network"
  }
  ports {
    internal = 3306
    external = 3306
    ip       = "0.0.0.0"
  }
  labels {
    label = "challenge"
    value = "second"
  }
    volumes {
    container_path = "/var/lib/mysql"
    volume_name = docker_volume.mariadb_volume.name
  }
}