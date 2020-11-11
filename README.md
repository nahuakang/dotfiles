# dotfile

Currently this repository contains only my `vimrc` file.

For installation, clone the repository to your local machine and then create symbolic links to the corresponding Vim or NeoVim directories:
```
$ ln -sf ~/dotfile/vimrc ~/.vim/vimrc  # Vim
$ ln -sf ~/dotfile/vimrc ~/.config/nvim/init.vim  # NeoVim
```

Then, install `Vim-Plug` for Vim or NeoVim according to instructions on [`vim-plug`](https://github.com/junegunn/vim-plug).)

Finally, open your Vim or NeoVim edtior in your terminal (you might receive error messages because some plugins specified in the `vimrc` file are not installed yet). Once the editor is on display, type `:PlugInstall` to proceed to install all desired plugins specified in the `vimrc` file.
