resource "kubernetes_service_v1" "this" {
  count = var.create ? 1: 0
  metadata {
    name = var.srv_name
    labels = var.srv_labels
    namespace = var.srv_ns
  }
  spec {
    selector = var.srv_selector
    port {
      port        = var.srv_port
      target_port = var.srv_target_port
    }

    type = var.srv_type
  }
}