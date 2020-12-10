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
    'decode_sec' )
      kubectl get secret "$1" -ojson | jq -r '.data[]' | base64 -D ;;
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
###

### brew
function brew_rollback() {
  if [ -n "$1" ] && [ -n "$2" ]; then
    cd "$(brew --repository)/Library/Taps/homebrew/homebrew-core/Formula"
    brew unlink "$1"
#    git log --grep="$1 $2" --pretty=%H | xargs -IX git checkout X -- "$1.rb"
#    HOMEBREW_NO_AUTO_UPDATE=1 brew install "$1"
    h=$(git log --grep="$1 $2" --pretty=%H)
    HOMEBREW_NO_AUTO_UPDATE=1 brew install "https://raw.githubusercontent.com/Homebrew/homebrew-core/$h/Formula/$1.rb"

    git reset --hard
    cd -
  fi
}
###

### Phablicity
#function arc_rebase() {
#   d=`arc diff master --allow-untracked  -m 'Stashed current changes' | grep ' Revision URI:' | awk -F '/' '{print $4}'`
#
#  build-support/bin/git_patch_trunk.sh
#
#  echo "You update $d"
#  read -p "ok? (y/N): " yn
#  case "$yn" in [yY]*) ;; *) echo "abort." ; exit ;; esac
#
#  arc diff master --allow-untracked -m 'Patched current master' -update $d
#}
###