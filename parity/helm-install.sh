curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh && \
chmod 700 get_helm.sh && \
bash -x ./get_helm.sh && \
kubectl create serviceaccount --namespace kube-system tiller && \
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller  && \
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}' && \
helm init --service-account tiller --upgrade