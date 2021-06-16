# Manage HashiCorp Cloud Platform HasHiCorp Virtual Network

resource "hcp_hvn" "new" {
  for_each       = var.hvn
  hvn_id         = each.key
  cloud_provider = each.value.csp
  region         = each.value.region
  cidr_block     = each.value.cidr
}


# Manage Consul Cluster in HashiCorp Cloud Platform

resource "hcp_consul_cluster" "new" {
  for_each   = var.consul_cluster
  cluster_id = each.key
  #  hvn_id          = hcp_hvn.new[each.key].hvn_id
  hvn_id          = each.value.hvn_id
  tier            = each.value.tier
  public_endpoint = each.value.public
  size            = each.value.size
}

# Create Consul ACL Root Token

resource "hcp_consul_cluster_root_token" "new" {
    for_each = hcp_consul_cluster.new
    cluster_id = each.value.cluster_id
}