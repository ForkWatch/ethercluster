# Kubernetes Ethercluster Files

Kubernetes Specification for Ethereum Classic and Ethereum Cluster Design.

To generate SSL keys and certificates for deployment, run the following command:

```sh
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ethercluster-key.key -out ethercluster-bundle.crt -subj "/CN=${HOST}/O=${HOST}"`
```
