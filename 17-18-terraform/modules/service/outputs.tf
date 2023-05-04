output "service_ip" {
    value = kubernetes_service_v1.this[0].spec[0].cluster_ip
}