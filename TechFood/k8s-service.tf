resource "kubectl_manifest" "service" {
    depends_on = [ kubectl_manifest.deploy ]
    yaml_body = <<YAML
apiVersion: v1
kind: Service
metadata:
  name: tech-food-service
  namespace: techfood
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: nlb
    service.beta.kubernetes.io/aws-load-balancer-scheme: internal
spec:
  selector:
    app: techfood
  ports:
    - port: 80
      targetPort: 8000
      protocol: TCP
  type: LoadBalancer
YAML
}
