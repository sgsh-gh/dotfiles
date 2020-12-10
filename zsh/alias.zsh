export LSCOLORS=gxfxcxdxbxegedabagacad
case ${OSTYPE} in
    darwin*)  colorflag='-G' ;;
    linux*)   colorflag='--color=auto' ;;
esac
alias lst="ls -ltr ${colorflag}"
alias ls="ls ${colorflag}"
alias la="ls -la ${colorflag}"
alias ll="ls -l ${colorflag}"

alias dki="docker run -it --rm"
alias dekx="docker exec -it"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias em='emacs .'


### k8s
alias _fzfk8salias="fzf --height 25 --header-lines=1 --reverse --multi --cycle"
alias -g P='$(kubectl get pods | _fzfk8salias | awk "{print \$1}")'
alias -g RS='$(kubectl get rs   | _fzfk8salias | awk "{print \$1}")'
alias -g DEP='$(kubectl get deploy  | _fzfk8salias | awk "{print \$1}")'
alias -g J='$(kubectl get job  | _fzfk8salias | awk "{print \$1}")'
alias -g CJ='$(kubectl get cj  | _fzfk8salias | awk "{print \$1}")'
alias -g DEP='$(kubectl get deploy  | _fzfk8salias | awk "{print \$1}")'
alias -g SVC='$(kubectl get svc  | _fzfk8salias | awk "{print \$1}")'
alias -g CM='$(kubectl get cm  | _fzfk8salias | awk "{print \$1}")'
alias -g SEC='$(kubectl get secret  | _fzfk8salias | awk "{print \$1}")'
alias -g NP='$(kubectl get networkpolicies  | _fzfk8salias | awk "{print \$1}")'
alias kctx='kubectl ctx'
function kctl() {
  case "$1" in
    'used_node' )
      kubectl get po -ojson | jq -r '.items[].spec.nodeName' | sort | uniq ;;
    'used_cm' )
      echo "Undefined" ;;
    'detached_cm' )
      echo "Undefined" ;;
    'used_sec' )
      echo "Undefined" ;;
    'detached_sec' )
      echo "Undefined" ;;
    'detached_nwp' )
      echo "Undefined" ;;
    * )
      kubectl "$@"
  esac
}
#TODO: Use open-svc plungin
function ksvc(){
  # ksvc ns service:port
  open "http://localhost:8001/api/v1/namespaces/$1/services/$2/proxy/"
}
###

### zoom
function zm() {
  if [ -n "$1" ] && [ -n "$2" ]; then
    open "zoommtg://zoom.us/join?confno=$1&pwd=$2"
  fi
}
