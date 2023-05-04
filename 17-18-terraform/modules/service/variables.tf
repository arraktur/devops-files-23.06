variable "create" {
    description = "Create or not service"
    type = bool
    default = true
}

variable "srv_name" {
    description = "Name of the service"
    type = string
    default = "service"
}

variable "srv_labels" {
    description = "Labels of the service"
}

variable "srv_ns" {
    description = "Namespace of the service"
    type = string
    default = "default"
}

variable "srv_selector" {
    description = "Selector of the service"
}

variable "srv_port" {
    description = "Service port"
    type = number
    default = 80
}

variable "srv_target_port" {
    description = "Service target port"
    type = number
    default = 80
}

variable "srv_type" {
    description = "Service type"
    type = string
    default = "ClusterIP"
}