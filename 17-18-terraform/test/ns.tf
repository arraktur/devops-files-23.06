resource "kubernetes_namespace_v1" "wp-ns" {
  metadata {
    labels = local.labels
    name = "${local.prefix}-ns"
  }
}