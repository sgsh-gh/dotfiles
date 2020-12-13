#! /bin/sh

cd "$(dirname "$0")" || exit
dir="$(git rev-parse --show-toplevel)"

#### Make symlink
### NOTE: moved to init.sh
#dotmklink() {
#  source="$HOME/$1"
#  dest="$dir/$1"
#  if [ ! -e "$source" ]; then
#    echo "Making symlink to $dest..."
#    ln -s "$dest" "$source"
#  else
#    echo "$source is existing."
#  fi
#}
#
#list='.zshrc .gitconfig .gitignore_global .emacs.d .vimrc .Brewfile .crontab .iterm2_shell_integration.zsh .oh-my-zsh'
#for v in $list; do
#  dotmklink "$v"
#done
####

### install packages
./brew.sh
./pyenv.sh
./jenv.sh
./rbenv.sh
./krew.sh
###

### Iterm2 config
Iterm2Config="$dir/.iterm2_shell_integration.zsh"
echo "Copying to $Iterm2Config"
curl -L 'https://iterm2.com/shell_integration/zsh' \
	-o "$Iterm2Config"
###

#### Oh-my-zsh
### I change to use git-submodule. If any problem I'll roll back these line.
#if [ ! -e "$ZSH" ]; then
#  echo "Installing ohmyzsh"
#  sh -c \
#    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --keep-zshrc"
#fi
####

### Arcanist
# NOTE: Do not use sub module, arc has own way to upgrade.
PHAB="$HOME/.phacility" # TODO: use .zsh variable
if [ ! -e "$PHAB" ]; then
	echo "Installing Phacility stack"
	mkdir "$PHAB"
	git clone https://github.com/phacility/libphutil.git "$PHAB/libphutil" -b stable
	git clone https://github.com/phacility/arcanist.git "$PHAB/arcanist" -b stable
else
	echo "Upgrading arcanist"
	arc upgrade
fi
###

### Crontab
# crontab ~/.crontab
### ...optional
