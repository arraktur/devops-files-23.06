locals {
  labels = {
    environment = var.env
    app = var.app_name
  }

  prefix = "${var.env}-${var.app_name}"

  wp_ip = data.terraform_remote_state.wp-data.outputs.wp_ip
}