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
              app = "frontend-app"
            }
          }
        }

        container {
          image = var.docker_uri
          name  = "frontend-app"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "500m"
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

resource "kubernetes_deployment_v1" "frontend_2" {
  metadata {
    name = "frontend-app-2"
    labels = {
      App = "frontend-app-2"
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "frontend-app-2"
      }
    }
    template {
      metadata {
        labels = {
          App = "frontend-app-2"
        }
      }
      spec {
        container {
          image = var.docker_uri
          name  = "frontend-app-2"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}