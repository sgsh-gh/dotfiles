#! /bin/sh

cd "$(dirname "$0")" || exit

### Make symlink
dir="$(git rev-parse --show-toplevel)"
list='.zshrc .gitconfig .gitignore_global .emacs.d .vimrc .Brewfile .crontab'
for v in $list; do
  dest="$HOME/$v"
  if [ ! -e "$dest" ]; then
    echo "Making symlink to $dest..."
    ln -s "$dir/$v" "$dest"
  fi
done
###

### install packages
./brew.sh
./pyenv.sh
./jenv.sh
./rbenv.sh
./krew.sh
###

### Iterm2 config #TODO: Copy file and symlink
Iterm2Config="$HOME/.iterm2_shell_integration.zsh"
if [ ! -e "$Iterm2Config" ]; then
  echo "Copying to $Iterm2Config"
  curl -L 'https://iterm2.com/shell_integration/zsh' \
    -o "$Iterm2Config"
else
  echo "Check update for $Iterm2Config manually"
fi
###

### Oh-my-zsh #TODO: Make this Submodule?
if [ ! -e "$ZSH" ]; then
  echo "Installing ohmyzsh"
  sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --keep-zshrc"
fi
###

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
