variable "tags" {
  description = "Tags to apply to your cluster for organizational purposes. (optional)"
  type        = list(string)
  default     = ["k8s-demo"]
}

variable "linode_token" {
  type    = string
  default = "notoken"
}

variable "k8s_version" {
  type    = string
  default = "1.18"
}

variable "label" {
  type    = string
  default = "rex-k8s-demo"
}

variable "region" {
  type    = string
  default = "us-east"
}

variable "pools" {
  description = "The Node Pool specifications for the Kubernetes cluster. (required)"
  type = list(object({
    type  = string
    count = number
  }))
  default = [
    {
      type  = "g6-standard-4"
      count = 1
    }
  ]
}
