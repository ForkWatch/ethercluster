openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ethercluster-key.key -out \
ethercluster-bundle.crt -subj "/CN=${HOST}/O=${HOST}" && \

kubectl create secret tls tls-mainnet \
  --key ./config/ethercluster-key.key \
  --cert ./config/ethercluster-bundle.crt \
  --namespace parity