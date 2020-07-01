###Environment Preparation and Installation

1. install kubectl
```shell script
 apt-get update
 curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
 echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
 apt-get update
 apt-get install -y kubectl
```

2. install minikube
```shell script
 curl -Lo minikube https://storage.googleapis.com/minikube/releases/v1.0.0/minikube-linux-amd64
 # move to /usr/local/bin directory
 chmod +x minikube
 cp minikube /usr/local/bin/
 rm minikube
```

3. start minikube
```shell script
 minikube start --vm-driver=none --cpus 6 --memory 12288 --disk-size=120g \
--extra-config=apiserver.authorization-mode=RBAC \
--extra-config=kubelet.resolv-conf=/run/systemd/resolve/resolv.conf \
--extra-config kubeadm.ignore-preflight-errors=SystemVerification
```

4. launch minikube dashboard
```shell script
    minikube dashboard
kubectl proxy --address="0.0.0.0" --port=9090 --accept-hosts '.*'&

```

kubeflow  should be accessible in the kubernetes Dashboard from her
http://<hostname>:9090/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/


5. launch the bootstrap script to download install kubeflow component via customize, no serving compponent will be installed for now
just training operators and pipeline