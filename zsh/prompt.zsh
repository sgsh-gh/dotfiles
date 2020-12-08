
### Kubernetes
source "$(brew --prefix)/opt/kube-ps1/share/kube-ps1.sh"
KUBE_PS1_CTX_COLOR=green

function get_cluster_short() {
  echo "$1" | cut -d' ' -f1 | cut -d'-' -f1-3
}
KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short


PS1='$(kube_ps1)'$PS1
###