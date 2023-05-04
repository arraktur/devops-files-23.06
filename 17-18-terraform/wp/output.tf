output "mysql_ip" {
    value = module.mysql-svc[0].service_ip
}

output "wp_ip" {
    value = module.wp-svc.0.service_ip
}