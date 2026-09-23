# https://kubernetes.io/docs/concepts/services-networking/ingress/
# https://kubernetes.github.io/ingress-nginx/user-guide/tls/
# https://kubernetes.io/docs/concepts/services-networking/ingress/#path-types

resource "kubernetes_ingress_v1" "frontend" {
  metadata {
    name = "front-ingress"

    annotations = {
        "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
    }
  }
  
  spec {
    ingress_class_name = "nginx"

    tls {
      hosts = ["frontend.example.com"]
      secret_name = kubernetes_secret_v1.frontend_tls.metadata[0].name
    }

    rule {
        host = "frontend.example.com"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          
          backend {
            service {
              name = kubernetes_service_v1.frontend.metadata[0].name
              port {
                number = kubernetes_service_v1.frontend.spec[0].port[0].port
              }
            }
          }
        }

        path {
          path = "/second"
          path_type = "Prefix"

          backend {
            service {
              name = kubernetes_service_v1.frontend_2.metadata[0].name
              port {
                number = kubernetes_service_v1.frontend_2.spec[0].port[0].port
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_secret_v1" "frontend_tls" {
  metadata {
    name = "frontend-tls"
  }

  type = "kubernetes.io/tls"

  data = {
    "tls.crt" = var.tls_certificate
    "tls.key" = var.tls_private_key
  }
}