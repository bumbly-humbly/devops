# DevOps-Training - From beginning to end


**Deploy a K8s cluster**
The kind kubernetes cluster and resource creation and configuration was done by 2 approaches for learning purposes as well.

K8s resources where written in yaml and with shell scripts for execution:
- k8s
- cluster/kind-create-cluster.sh
- cluster/kind-cluster-config.yml

In step 2 Terraform was used to as IaC tool, to learn how to use it and solve the challenge.
- terraform
- tls

**Run a “Hello-World” Container**
The frontend was built with simple javascript, html and css. Nginx is used for serving the frontend via Docker.

**Autoscaling & traffic routing**
- terraform/deployments.tf
- terraform/services.tf
- terraform/hpa.tf

Metrics server for HPA
https://kubernetes-sigs.github.io/metrics-server/

**Ingress-Controller**
- cluster/install-ingress-nginx.sh
- terraform/ingress.tf

**Bonus I: Network hardening**
Not implemented

**Bonus II: Monitoring concept**
Uptime Kuma seems a simple solution in this project to measure latency and do health checks. Liveness and Readiness probes.
https://uptimekuma.co/wiki/add-a-monitor-in-uptime-kuma/

**Bonus III: Automation & CI/CD**
Github Actions is used for CI/CD.

Pushes/merges on the main branch builds and publishes a new version to a container registry.
.github/workflows/docker-publish.yml
Terraform checks - Formatting and validation
.github/workflows/terraform-check.yml
