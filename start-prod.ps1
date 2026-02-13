echo "Starting Production Tunnels..."

# 1. Open ArgoCD (Port 8080)
Start-Process powershell -ArgumentList "-NoExit", "-Command kubectl port-forward svc/argocd-server -n argocd 8080:443"

# 2. Open Prometheus (Port 9090)
# Note: Maps local 9090 to service port 80
Start-Process powershell -ArgumentList "-NoExit", "-Command kubectl port-forward svc/prometheus-service -n monitoring 9090:80"

# 3. Open Grafana (Port 3000)
# Note: Maps local 3000 to service port 80
Start-Process powershell -ArgumentList "-NoExit", "-Command kubectl port-forward svc/grafana-service -n monitoring 3000:80"

echo "Done! Check your new windows."