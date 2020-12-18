
### Kubernetes
source "$(brew --prefix)/opt/kube-ps1/share/kube-ps1.sh"
export KUBE_PS1_CTX_COLOR=green

function get_cluster_short() {
  #TODO: optimize cut
  echo "$1" | cut -d'-' -f1-3
}
export KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short


export PS1='$(kube_ps1)%{$fg_bold[cyan]%}%2~%{$fg_bold[blue]%}$(git_prompt_info | sed "s/git//") %{$reset_color%}» '
###