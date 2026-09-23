variable "host" {
  type = string
}

variable "client_certificate" {
  type = string
}

variable "client_key" {
  type = string
}

variable "cluster_ca_certificate" {
  type = string
}

variable "docker_uri" {
  type = string
}

variable "tls_certificate" {
  type      = string
  sensitive = true
}

variable "tls_private_key" {
  type      = string
  sensitive = true
}