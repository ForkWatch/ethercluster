kubectl delete deploy nginx-ingress-mn-controller --namespace parity && \
kubectl delete deploy nginx-ingress-mn-default-backend --namespace parity && \
kubectl delete svc nginx-ingress-mn-controller --namespace parity && \
kubectl delete svc nginx-ingress-mn-default-backend --namespace parity && \