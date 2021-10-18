#!/usr/bin/env bash

set -eoux pipefail

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# minikube start --driver=virtualbox --cpus=3 --memory=5000
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

kubectl delete namespace elastic-stack || true
kubectl create namespace elastic-stack

kubectl create secret generic elastic-credentials \
  --from-literal=username=elastic \
  --from-literal=password=Passw0rd \
  --namespace=elastic-stack

cd helm-charts/

helm install elasticsearch ./elasticsearch \
  --namespace=elastic-stack \
  --values=values/elasticsearch.yaml

helm install kibana ./kibana \
  --namespace=elastic-stack \
  --values=values/kibana.yaml

set +x

printf "\n"
echo "kubectl port-forward --namespace=elastic-stack svc/elasticsearch-master 9200"
echo "Access: http://localhost:9200"

printf "\n"
echo "kubectl port-forward --namespace=elastic-stack svc/kibana-kibana 5601"
echo "Access: http://localhost:5601"

printf "\n"
echo "Welcome to Elastic"
echo "Username: elastic"
echo "Password: Passw0rd"

printf "\n"
