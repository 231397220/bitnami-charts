
# 需要先部署bitnami-common
# helm_prod1 dependency update

# 部署前初始化内容
kubectl_prod1 create namespace grafana



helm_prod1 upgrade --install grafana -f eks.yaml ./  -n grafana