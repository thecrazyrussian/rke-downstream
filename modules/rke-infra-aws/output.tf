# Outputs

output "rke_nodes" {
  value = [
    for instance in flatten([[aws_instance.node_all], [aws_instance.node_master], [aws_instance.node_svc_worker], [aws_instance.node_game_worker]]) : {

      public_ip  = instance.public_ip
      private_ip = instance.private_ip
      hostname   = instance.id
      user       = var.node_username
      roles      = split(",", instance.tags.K8sRoles)
    }
  ]
  sensitive = true
}
