locals {
  labels = {
    environment = var.env
    app = var.app_name
  }

  prefix = "${var.env}-${var.app_name}"
}