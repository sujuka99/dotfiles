# Dotfiles

## Contents

## Introduction

Here I store all my dotfiles.

## Recommended usage

_Taken from [Bitbucket](https://www.atlassian.com/git/tutorials/dotfiles)._

Steps:

1. Clone repo: `git clone --bare <git-repo-url> $HOME/.cfg`
2. Setup git:
    1. `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
    2. `config config --local status.showUntrackedFiles no`
3. Checkout the actual content: `config checkout`
4. Use like any other repository:

    ```bash
    config status
    config add .vimrc
    config commit -m "Add vimrc"
    config add .bashrc
    config commit -m "Add bashrc"
    config push
    ```

## Files

### Zsh

My Zsh config.

### Neovim

My Neovim config.

