resource "kubernetes_deployment_v1" "mysql-dep" {
  metadata {
    name = "mysql"
    namespace = kubernetes_namespace_v1.wp-ns.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }

      spec {
        container {
          image = var.mysql_image
          name  = "mysql"
          port {
            container_port = var.mysql_port
          }

          env_from {
            secret_ref {
              name = "mysql-secret"
            }
          }
          volume_mount {
            name = "db-data"
            mount_path = "/var/lib/mysql"
          }

        }
        volume {
          name = "db-data"
          persistent_volume_claim {
            claim_name = "pvc-mysql"
          }
        }
      }
    }
  }
}