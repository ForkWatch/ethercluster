# Kubernetes Ethercluster Files

Kubernetes Specification for Ethereum Classic and Ethereum Cluster Design.


## Google Cloud Kubernetes Engine Initialization

`gcloud config set compute/zone us-central1-f`

`gcloud container clusters create <CLUSTERNAME> --num-nodes 2 --machine-type n1-standard-2 --scopes "https://www.googleapis.com/auth/projecthosting,cloud-platform"`

`gcloud container clusters list`

`gcloud container clusters get-credentials <CLUSTERNAME>`

`kubectl cluster-info`

`wget https://storage.googleapis.com/kubernetes-helm/helm-v2.9.1-linux-amd64.tar.gz`

`tar zxfv helm-v2.9.1-linux-amd64.tar.gz`

`cp linux-amd64/helm .`

`kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value account)`

`kubectl create serviceaccount tiller --namespace kube-system`

`kubectl create clusterrolebinding tiller-admin-binding --clusterrole=cluster-admin --serviceaccount=kube-system:tiller`

```
./helm init --service-account=tiller
./helm update
```

## Kubernetes Cluster Initialization

`kubectl create -f namespace.yml`

`kubectl create configmap parity-config --from-file=./config/config.toml --namespace parity`

`kubectl create -f storage-class-pd-ssd.yml`

`kubectl create secret generic parity-config --namespace parity --from-file=config.toml=config/config.toml`

To generate SSL keys and certificates for deployment, run the following command:
`openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ethercluster-key.key -out ethercluster-bundle.crt -subj “/CN=${HOST}/O=${HOST}”`

`kubectl create secret tls tls-classic --key ./config/ethercluster-key.key --cert ./config/ethercluster-bundle.crt --namespace parity`

`kubectl create -f parity-stateful-set.yml`

`kubectl create -f parity-service.yml`

`kubectl create -f parity-ingress.yml`

`./helm install --name nginx-ingress-classic stable/nginx-ingress --set rbac.create=true --namespace parity`

## No NGINX Setup for Testing


`kubectl create -f namespace.yml`

`kubectl create configmap parity-config --from-file=./config/config.toml --namespace parity`

`kubectl create -f storage-class-pd-ssd.yml`

`kubectl create secret generic parity-config --namespace parity --from-file=config.toml=config/config.toml`

Setup service to use LoadBalancer
`kubectl create -f parity-service.yml`

`kubectl create -f parity-stateful-set.yml`

Test it with:
```sh
curl --data '{"method":"eth_blockNumber","params":[],"id":1,"jsonrpc":"2.0"}' -H "Content-Type: application/json" -X POST <LOADBALANCER-IP>:8545
```
