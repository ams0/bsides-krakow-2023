# bsides-krakow-2023
Repo for Ambient Mesh demo at BSides Krakow 2023



## Prerequisites

- `Helm` and `kubectl` installed
- `istioctl` installed and at 1.9.0 or higher
- A Kubernetes cluster with a CNI plugin (but NO Cilium, yet)
  
## Install Istio

```bash
bash manifests/install-istio.sh
```

## (Optional) Configure Azure DNS with wildcard)

You'll need a DNS zone in a resource group called `dns` (or change the script). The script will create a wildcard record pointing to the Istio ingress gateway.

```bash
export GATEWAY_IP=$(kubectl get svc -n istio-system istio-ingressgateway -ojsonpath='{.status.loadBalancer.ingress[0].ip}')
export DOMAIN_NAME="k8s.computer"
export DNS_RG="dns"

az network dns record-set a delete -g ${DNS_RG} -z ${DOMAIN_NAME} -n '*' -y
az network dns record-set a add-record -g ${DNS_RG}s -z  ${DOMAIN_NAME} -n '*' -a $GATEWAY_IP
dig any.k8s.computer +short
```

## Install the demo app

```bash
## Monitor Istio and proxies

Install Kiali and Prometheus+Grafana

```bash
bash manifests/helm-install-kiali.sh
bash manifests/install-prometheus.sh

```

```bash
kubectl apply -f manifests/svcmon-podmon-istio.yaml
```

## Expose Services
Expose the monitoring services to the outside world (beware, no authentication is configured!)

```bash
kubectl apply -f manifests/kiali-gw.yaml
kubectl apply -f manifests/grafana-gw.yaml
kubectl apply -f manifests/prometheus-gw.yaml
```