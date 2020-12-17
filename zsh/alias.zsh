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

alias lines='wc -l'
alias words='wc -w'
alias chars='wc -c'

alias -s gz='tar -xzvf'
alias -s html='open'

function mkduch(){
  if [ -n "$1" ]; then
    local d="$(dirname "$1")"
    local f="$(basename "$1")"
    mkdir -p "$d" && touch "$1"
  else
    echo "Missing argument"
  fi

}
### fzf
export FZF_DEFAULT_OPTS='--height 40% --border --cycle --layout=reverse'
###

### git
function fbr(){
  git branch -vv --sort=committerdate | fzf --tac +m | sed 's/\*//' | awk '{print $1}'
}
alias -g BR='fbr'
###

### k8s
function kubels(){
  local prmp=$(kubectl get "$1" | head -n1)
  kubectl get "$1" | tail -n +2 | fzf "--prompt=$prmp" | awk '{print $1}' | sed  "s/^/$1\//g"
}
alias -g P='kubels po'
alias -g RS='kubels rs'
alias -g DEP='kubels deploy'
alias -g J='kubels job'
alias -g CJ='kubels cj'
alias -g SVC='kubels svc'
alias -g CM='kubels  cm'
alias -g SEC='kubels secret'
alias -g NP='kubels networkpolicies'
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
      shift
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
function frev(){
  arc list | fzf --ansi --no-sort | sed 's/^.*\(D[0-9]*\):.*$/\1/g'
}
alias -g REV='frev'
###

function fzf-history-selection() {
    BUFFER=$(history -n 1 | awk '!a[$0]++' | fzf --tac --no-sort)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-history-selection
bindkey '^R' fzf-history-selection

function fzf-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | fzf --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N fzf-cdr
bindkey '^x' fzf-cdr
