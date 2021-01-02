//Use the linode_lke_cluster resource to create
//a Kubernetes cluster
resource "linode_lke_cluster" "foobar" {
  k8s_version = var.k8s_version
  label       = var.label
  region      = var.region
  tags        = var.tags

  dynamic "pool" {
    for_each = var.pools
    content {
      type  = pool.value["type"]
      count = pool.value["count"]
    }
  }
}


// write out our kubeconfig ( in base64 )
resource "local_file" "kubeconfig" {
    content     = linode_lke_cluster.foobar.kubeconfig
    filename = "${path.module}/kubecfg.b64"
}

