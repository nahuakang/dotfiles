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
# Install `packer.nvim`
$ git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Soft link all in `nvim/` to NeoVim location
$ ln -sf ~/dotfiles/nvim/* ~/.config/nvim/ # NeoVim

# Run `:PackerInstall`
```

For `alacritty`, make sure to install [oh my tmux](https://github.com/gpakosz/.tmux) to install the config as well as to customize locally.
