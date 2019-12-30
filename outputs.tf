
# Output the IP Address of the Container 

output "container_ip_address" {
  value = "${docker_container.ghost_container.ip_address}"
}

output "container_name" {
  value = "${docker_container.ghost_container.name}"
}
