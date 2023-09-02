kubectl get crd gateways.gateway.networking.k8s.io &> /dev/null || \
  { kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v0.8.0" | kubectl apply -f -; }

istioctl install --set profile=ambient -y \
--set "components.ingressGateways[0].enabled=true" \
--set "components.ingressGateways[0].name=istio-ingressgateway" \
--set "components.egressGateways[0].enabled=true" \
--set "components.egressGateways[0].name=istio-egressgateway"