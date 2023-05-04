# output "mysql_ip" {
#     value = kubernetes_service_v1.mysql-svc[0].spec[0].cluster_ip
# }

output "wp_ip" {
    value = local.wp_ip
}

output "full_details" {
  value = data.terraform_remote_state.wp-data.outputs
}