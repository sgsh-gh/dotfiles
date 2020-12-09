#!/bin/bash

DOT_DIR="~/dotfiles"

has() {
    type "$1" > /dev/null 2>&1
}

if [ ! -d ${DOT_DIR} ]; then
    if has "git"; then
        git clone https://github.com/sgsh-gh/dotfiles.git ${DOT_DIR} --recursive
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

    cd ${DOT_DIR}
    while read -d $'\0' f; do
        [[ "$f" != ".*" ]] && continue
        [[ "$f" == ".git" ]] && continue
        [[ "$f" == ".gitignore" ]] && continue
        [[ "$f" == ".gitmodules" ]] && continue
        [[ "$f" == ".DS_Store" ]] && continue
        [[ "$f" == ".idea" ]] && continue
        [[ "$f" == ".local" ]] && continue

        ln -s "$DOT_DIR/$f" "$HOME/$f" #TODO: consider -fh options
        echo "Installed $f"
    done < <(find "${DOT_DIR}" -mindepth 1 -maxdepth 1 -print0)

else
    echo "dotfiles already exists"
    exit 1
fi