helm upgrade --install \
    --set cr.create=true \
    --set cr.namespace=istio-system \
    --set cr.spec.auth.strategy=anonymous \
    --set cr.spec.external_services.prometheus.url=http://prometheus-operated.monitoring.svc.cluster.local:9090 \
    --namespace kiali-operator \
    --create-namespace \
    --repo https://kiali.org/helm-charts \
    kiali-operator \
    kiali-operator