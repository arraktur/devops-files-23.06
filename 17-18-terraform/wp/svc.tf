module "mysql-svc" {
  count  = var.create ? 1: 0
  source = "git::https://github.com/Fenikks/terraform-demo.git//service2"

  srv_name     = "mysql-service"
  srv_labels   = local.labels
  srv_ns       = kubernetes_namespace_v1.wp-ns.metadata[0].name
  srv_selector = {
    app = "mysql"
  }
  srv_port = var.mysql_port
  srv_target_port = var.mysql_port
}

module "wp-svc" {
  count  = var.create ? 1: 0
  source = "../modules/service"

  srv_name     = "wp-service"
  srv_labels   = local.labels
  srv_ns       = kubernetes_namespace_v1.wp-ns.metadata[0].name
  srv_selector = local.labels
  srv_port     = var.wp_srv_port
}
