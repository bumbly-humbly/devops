#Horizontal Pod Autoscaler automatically scales the number of pods in a replication controller, 
#deployment or replica set based on observed CPU utilization.

resource "kubernetes_horizontal_pod_autoscaler_v1" "frontend_hpa" {
  metadata {
    name = "frontend-hpa"
  }

  spec {
    max_replicas = 4
    min_replicas = 1

    scale_target_ref {
      api_version = "apps/v1"
      kind = "Deployment"
      name = "frontend-app"
    }
  }
}
