variable "hvn" {
  description = "Define the HVN Configuration"
  type        = map(any)
  default = {
    "hvn-us" = {
      csp    = "aws",
      region = "us-east-1",
      cidr   = "172.25.16.0/20"
    },
    "hvn-eu" = {
      csp    = "aws",
      region = "eu-west-1",
      cidr   = "172.26.16.0/20"
    }
  }
}

variable "consul_cluster" {
  description = "Define the Consul Cluster configuration"
  type        = map(any)
  default = {
    "consul-us" = {
      tier   = "development",
      hvn_id = "hvn-us",
      public = true,
      size   = "X_SMALL"
    },
    "consul-eu" = {
      tier   = "development",
      hvn_id = "hvn-eu",
      public = true,
      size   = "X_SMALL"
    }
  }
}

