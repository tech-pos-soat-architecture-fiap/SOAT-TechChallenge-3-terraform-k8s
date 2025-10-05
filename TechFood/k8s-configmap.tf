resource "kubectl_manifest" "configmap" {
    depends_on = [ kubectl_manifest.namespace ]
    yaml_body = <<YAML
apiVersion: v1
kind: ConfigMap
metadata:
  name: tech-food-configmap-v1
  namespace: techfood
  labels:
    app: tech-food-configmap-v1
    component: config
    version: v1
data:
  SPRING_DATASOURCE_URL: "jdbc:postgresql://tech-food.c34qiakmaq1a.us-east-1.rds.amazonaws.com/tech-food"
YAML
}