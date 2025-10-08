kubectl get deployments -o=jsonpath='{range .items[*]}{.metadata.namespace}{"\t"}{.metadata.name}{"\t"}{range .spec.template.spec.containers[*]}{.image}{"\n"}{end}{end}'

# monitoring	kube-prom-stack-grafana	quay.io/kiwigrid/k8s-sidecar:1.30.0
# quay.io/kiwigrid/k8s-sidecar:1.30.0
# docker.io/grafana/grafana:11.6.0
# monitoring	kube-prom-stack-grafana-image-renderer	docker.io/grafana/grafana-image-renderer:v4.0.11
# monitoring	kube-prom-stack-kube-prome-operator	quay.io/prometheus-operator/prometheus-operator:v0.81.0
# monitoring	kube-prom-stack-kube-state-metrics	registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.15.0
# monitoring	loki-gateway	docker.io/nginxinc/nginx-unprivileged:1.27-alpine