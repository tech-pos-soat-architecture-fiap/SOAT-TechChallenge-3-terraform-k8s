resource "kubectl_manifest" "deploy" {
    depends_on = [ kubectl_manifest.configmap ]
    yaml_body = <<YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tech-food-deployment-v1
  namespace: techfood
  labels:
    app: tech-food-deployment-v1
    version: v1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: techfood
  template:
    metadata:
      labels:
        app: techfood
    spec:
      containers:
        - name: techfood
          image: 207347338383.dkr.ecr.us-east-1.amazonaws.com/techfood:v6
          imagePullPolicy: IfNotPresent
          ports:
            - containerPort: 8000
          envFrom:
            - configMapRef:
                name: tech-food-configmap-v1
          resources:
            requests:
              memory: "256Mi"
              cpu: "100m"
            limits:
              memory: "512Mi"
              cpu: "500m"
          livenessProbe:
            httpGet:
              path: /actuator/health
              port: 8000
            initialDelaySeconds: 60
            periodSeconds: 30
            timeoutSeconds: 10
            failureThreshold: 3
          readinessProbe:
            httpGet:
              path: /actuator/health
              port: 8000
            initialDelaySeconds: 30
            periodSeconds: 10
            timeoutSeconds: 5
            failureThreshold: 3
YAML
}