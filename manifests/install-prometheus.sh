helm upgrade --install \
  --namespace monitoring \
  --create-namespace \
  --set grafana.defaultDashboardsEnabled=false \
  --set 'grafana.grafana\.ini.auth\.anonymous.enabled'=true \
  --set 'grafana.grafana\.ini.auth\.anonymous.org_role'=Admin \
  --set 'grafana.grafana\.ini.auth\.anonymous.org_name'="Main Org." \
  prometheus \
  prometheus-community/kube-prometheus-stack