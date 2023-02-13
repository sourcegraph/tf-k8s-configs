resource "kubernetes_manifest" "sourcegraph_cert" {
  manifest = {
    "apiVersion" = "networking.gke.io/v1"
    "kind"       = "ManagedCertificate"
    "metadata"   = {
        "name"      = "${var.deployment_name}-${random_string.suffix.result}-ssl-cert"
        "namespace" = "sourcegraph"
    }
    "spec"       = {
        "domains" = [
            var.ssl_domain
        ]
    }
  }
}