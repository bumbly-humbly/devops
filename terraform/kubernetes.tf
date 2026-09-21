terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.0"
    }
  }
}
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

provider "kubernetes" {
  host = var.host

  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}

resource "kubernetes_deployment_v1" "frontend" {
  metadata {
    name = "frontend-app"
    labels = {
      App = "frontend-app"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "frontend-app"
      }
    }
    template {
      metadata {
        labels = {
          App = "frontend-app"
        }
      }

      spec {
        topology_spread_constraint {
          max_skew           = 1
          topology_key       = "kubernetes.io/hostname"
          when_unsatisfiable = "DoNotSchedule"

          label_selector {
            match_labels = {
              app = "demo-app"
            }
          }
        }

        container {
          image = "ghcr.io/bumbly-humbly/frontend:v1.0.0"
          name  = "frontend-app"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "frontend" {
  metadata {
    name = "front-svc"
  }
  spec {
    selector = {
      App = kubernetes_deployment_v1.frontend.spec.0.template.0.metadata[0].labels.App
    }
    port {
      node_port   = 31437
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}
