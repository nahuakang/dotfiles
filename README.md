# Dotfiles

## Meta
Terminal: [Alacritty](https://github.com/alacritty/alacritty)

Prompt: [Starship](https://starship.rs/)

Shell: `zsh` + `oh-my-zsh` for plugin management

## Tools
[Reference 1](https://mahmoudashraf.dev/blog/my-terminal-became-more-rusty/)

[Reference 2](https://kbknapp.dev/shell-setup/)

[git-delta](https://github.com/dandavison/delta)

[exa](https://github.com/ogham/exa)

[custom starship commands](https://github.com/starship/starship/discussions/1252)

## dotfile

Currently this repository contains only my `vimrc` file.

For installation, clone the repository to your local machine and then create symbolic links to the corresponding Vim or NeoVim directories:
```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
$ ln -sf ~/dotfiles/vimrc ~/.vim/vimrc  # Vim
$ ln -sf ~/dotfiles/vimrc ~/.config/nvim/init.vim  # NeoVim
```

Then, install `Vim-Plug` for Vim or NeoVim according to instructions on [`vim-plug`](https://github.com/junegunn/vim-plug).)

Finally, open your Vim or NeoVim edtior in your terminal (you might receive error messages because some plugins specified in the `vimrc` file are not installed yet). Once the editor is on display, type `:PlugInstall` to proceed to install all desired plugins specified in the `vimrc` file.

For `alacritty`, make sure to install [oh my tmux](https://github.com/gpakosz/.tmux) to install the config as well as to customize locally.
