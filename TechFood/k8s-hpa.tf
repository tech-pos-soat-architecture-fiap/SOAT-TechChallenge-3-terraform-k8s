resource "kubectl_manifest" "hpa" {
    depends_on = [ kubectl_manifest.deploy ]
    yaml_body = <<YAML
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: tech-food-hpa
  namespace: techfood
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: tech-food-deployment-v1
  minReplicas: 1
  maxReplicas: 2
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 40
YAML
}