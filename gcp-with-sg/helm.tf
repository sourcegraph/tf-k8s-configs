resource "helm_release" "sourcegraph" {
    depends_on       = [module.gke]
    name             = "sourcegraph"
    repository       = "https://helm.sourcegraph.com/release"
    chart            = "sourcegraph"
    namespace        = "sourcegraph"
    create_namespace = true
    version          = var.sourcegraph_version
    ##############################################
    ### The override.yaml file does not        ###
    ### exist in the resources directory       ###
    ### by default. Please consult Sourcegraph ###
    ### documentation on info for creating     ###
    ### an override file.                      ###
    ##############################################
    values           = [
        "${file("./resources/override.yaml")}"
    ]

    set {
      name  = "frontend.ingress.host"
      value = var.ssl_domain
    }

    set {
      name  = "frontend.ingress.annotations.networking\\.gke\\.io/managed-certificates"
      value = google_compute_managed_ssl_certificate.sourcegraph_cert.name
    }
}