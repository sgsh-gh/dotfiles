### Brew
export PATH=/usr/local/bin:$PATH
###

### Kubernets
export PATH="${PATH}:${HOME}/.krew/bin"
###

### Java
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
###

### Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
###

### Ruby
eval "$(rbenv init -)"
###

### Haskell
export PATH="$HOME/.local/bin:$PATH"
###

### Phacility
export PHAB="$HOME/.phacility"
export PATH="$PATH:$PHAB/arcanist/bin"
###