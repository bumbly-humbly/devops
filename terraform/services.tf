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