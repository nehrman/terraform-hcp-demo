output "consul-public-addr" {
  value = [
    for consul in hcp_consul_cluster.new :
    (consul.consul_public_endpoint_url != "" ? [consul.consul_private_endpoint_url, consul.consul_public_endpoint_url] : [consul.consul_private_endpoint_url])
  ]
}

output "consul_root_token" {
  value = [
    for token in hcp_consul_cluster_root_token.new :
    token.secret_id
  ]
  sensitive = true
}