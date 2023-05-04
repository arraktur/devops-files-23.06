variable "mysql_port" {}

variable "wp_srv_port" {}

variable "mysql_image" {}

variable "wp_image" {
    default = "wordpress"
}

variable "mysql_wp_db_name" {
    default = "demodb"
}

variable "env" {
    default = "dev"
}
variable "create" {
    default = true
}

variable "app_name" {
    default = "wordpress"
}

variable "tf_token" {
  sensitive = true
}

variable "dockepass" {
  sensitive = true
}