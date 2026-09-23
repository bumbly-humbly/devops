# https://kubernetes.io/docs/concepts/services-networking/

resource "kubernetes_service_v1" "frontend" {
  metadata {
    name = "front-svc"
  }
  spec {
    selector = {
      App = kubernetes_deployment_v1.frontend.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_service_v1" "frontend_2" {
  metadata {
    name = "front-svc-2"
  }
  spec {
    selector = {
      App = kubernetes_deployment_v1.frontend_2.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}