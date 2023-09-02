istioctl install --set profile=ambient -y \
--set "components.ingressGateways[0].enabled=true" \
--set "components.ingressGateways[0].name=istio-ingressgateway" \
--set "components.egressGateways[0].enabled=true" \
--set "components.egressGateways[0].name=istio-egressgateway"