resource "kubernetes_secret_v1" "wp-secret" {
  metadata {
    name = "mysql-secret"
    namespace = kubernetes_namespace_v1.wp-ns.metadata[0].name
  }

  data = {
    MYSQL_USER = "demouser"
    MYSQL_PASSWORD = "demopass"
    MYSQL_DATABASE = var.mysql_wp_db_name
    MYSQL_RANDOM_ROOT_PASSWORD = 1
  }

  type = "Opaque"
}