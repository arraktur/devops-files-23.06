resource "kubernetes_deployment_v1" "wp-dep" {
  metadata {
    name = "wp"
    labels = local.labels
    namespace = kubernetes_namespace_v1.wp-ns.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = local.labels
    }

    template {
      metadata {
        labels = local.labels
      }

      spec {
        container {
          image = var.wp_image
          name  = "wordpress"
          port {
            container_port = 80
          }

          env {
            name = "WORDPRESS_DB_USER"
            value_from {
              secret_key_ref {
                name = "mysql-secret"
                key = "MYSQL_USER"
              }
            }
          }

          env {
            name = "WORDPRESS_DB_PASSWORD"
            value_from {
              secret_key_ref {
                name = "mysql-secret"
                key = "MYSQL_PASSWORD"
              }
            }
          }

          env {
            name = "WORDPRESS_DB_NAME"
            value_from {
              secret_key_ref {
                name = "mysql-secret"
                key = "MYSQL_DATABASE"
              }
            }
          }

          env {
            name = "WORDPRESS_DB_HOST"
            value = "mysql"
          }


          volume_mount {
            name = "wp-data"
            mount_path = "/var/www/html"
          }

        }
        volume {
          name = "wp-data"
          persistent_volume_claim {
            claim_name = "pvc-wp"
          }
        }
      }
    }
  }
}