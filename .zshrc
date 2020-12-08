
### Prepare package managers
source $HOME/dotfiles/zsh/pkg-manager.zsh
###

### IMPORTS
source $HOME/dotfiles/zsh/ohmyzsh.zsh
source $HOME/dotfiles/zsh/prompt.zsh
source $HOME/dotfiles/zsh/alias.zsh
source $HOME/dotfiles/.local/.zshrc >/dev/null 2>&1 || echo "You can put personal config in $HOME/dotfiles/.local/.zshrc"
source $HOME/.iterm2_shell_integration.zsh
###

bindkey -e
ulimit -u 1024
export LANG=ja_JP.UTF-8

autoload -Uz compinit && compinit # activate auto-completion
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

### Command history
export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_space
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
###

