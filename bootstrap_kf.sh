
export KF_NAME="kfdemo-1"
export BASE_DIR="."
export KF_DIR=${BASE_DIR}/${KF_NAME}
export CONFIG_URI="https://raw.githubusercontent.com/kubeflow/manifests/master/kfdef/kfctl_k8s_istio.v1.0.2.yaml"
export CONFIG_FILE="${KF_DIR}/kfctl_k8s_istio.yaml"
if [ -d "${KF_DIR}" ]; then rm -Rf ${KF_DIR}; fi
mkdir -p ${KF_DIR}
cd ${KF_DIR}
kfctl build -V -f ${CONFIG_URI}

#kfctl apply -V -f "kfctl_k8s_istio.yaml"