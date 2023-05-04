resource "kubernetes_persistent_volume_claim_v1" "mysql-pvc" {
  metadata {
    name = "pvc-mysql"
    namespace = kubernetes_namespace_v1.wp-ns.metadata[0].name
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }

}

resource "kubernetes_persistent_volume_claim_v1" "wp-pvc" {
  metadata {
    name = "pvc-wp"
    namespace = kubernetes_namespace_v1.wp-ns.metadata[0].name
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}