#!/bin/bash

DOT_DIR="$HOME/dotfiles"

has() {
	type "$1" >/dev/null 2>&1
}

if [ ! -d "${DOT_DIR}" ]; then
	if has "git"; then
		git clone https://github.com/sgsh-gh/dotfiles.git "${DOT_DIR}" --recursive
	elif has "curl" || has "wget"; then
		TARBALL="https://github.com/sgsh-gh/dotfiles/archive/main.tar.gz"
		if has "curl"; then
			curl -L ${TARBALL} -o main.tar.gz
		else
			wget ${TARBALL}
		fi
		tar -zxvf main.tar.gz
		rm -f main.tar.gz
		mv -f dotfiles-main "${DOT_DIR}"
	else
		echo "curl or wget or git required"
		exit 1
	fi
else
	echo "dotfiles already exists"
fi

cd "${DOT_DIR}" || exit
for f in .??*; do
	[[ "$f" == ".git" ]] && continue
	[[ "$f" == ".gitignore" ]] && continue
	[[ "$f" == ".gitmodules" ]] && continue
	[[ "$f" == ".DS_Store" ]] && continue
	[[ "$f" == ".idea" ]] && continue
	[[ "$f" == ".local" ]] && continue
  [[ "$f" == ".github" ]] && continue
	[[ "$f" == ".phacility" ]] && continue #NOTE: under investigation of git sub-module
	src="$HOME/$f"
	dest="$DOT_DIR/$f"
	echo "Making symlink to $dest..."
	ln -sfh "$dest" "$src"
done

mkdir "$HOME/dotfiles_local" || true
mkdir -p "$HOME/ghq/local" || true
ln -fsh  "$HOME/dotfiles_local" "$HOME/ghq/local/dotfiles_local"
mkdir -p "$HOME/ghq/github.com/sgsh-gh" || true
ln -fsh  "$HOME/dotfiles" "$HOME/ghq/github.com/sgsh-gh/dotfiles"
