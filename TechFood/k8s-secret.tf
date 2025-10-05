# resource "kubectl_manifest" "secret" {
#     depends_on = [ kubectl_manifest.namespace ]
#     yaml_body = <<YAML
# apiVersion: v1
# kind: Secret
# metadata:
#   name: tech-food-db-secret-v1
#   namespace: techfood
#   labels:
#     app: tech-food-db-secret-v1
#     component: secrets
#     version: v1
# type: Opaque
# data:
#   POSTGRES_USER: ${var.db_username}
#   POSTGRES_PASSWORD: ${var.db_password}
# YAML
# }