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
  SERVER_PORT: "8000"
  SPRING_DATASOURCE_URL: "jdbc:h2:mem:testdb"
  SPRING_DATASOURCE_DRIVER_CLASS_NAME: "org.h2.Driver"
  SPRING_JPA_DATABASE_PLATFORM: "org.hibernate.dialect.H2Dialect"
  SPRING_H2_CONSOLE_ENABLED: "true"
  SPRING_JPA_PROPERTIES_HIBERNATE_DIALECT: "org.hibernate.dialect.H2Dialect"
  POSTGRES_USER: ""
  POSTGRES_PASSWORD: ""
YAML
}