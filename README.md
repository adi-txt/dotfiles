# 🛠  dotfiles

This repository contains my configuration files for Bash, Git, Tmux, and Vim.

Here are instructions on how to utilize said files:

1. `.bashrc`
  - This needs to be placed in your home folder and sourced to be activated.
  - Sourcing the new `.bashrc` file can be done as follows:
  ```
  source ~/.bashrc
  ```

2. `.bash_profile`
  - This only needs to be placed in your home folder if you are working 
  on macOS.

3. `.gitconfig`
  - This also needs to be placed in your home folder.
  - Additionally, you will need to edit your email and name here to 
  match your own GitHub profile's email and name. And you need to have 
  git installed..

![Alt Text](https://media.giphy.com/media/v3ptWNDUNipVe/giphy.gif)

4. `.tmux.conf`
  - This also goes into your home folder, and only works if you've installed 
  Tmux. This can be done by following instructions [here](https://hackernoon.com/a-gentle-introduction-to-tmux-8d784c404340).

5. `.vimrc`
  - This needs to be placed in your home folder if you are using Vim, but if 
  you choose to use NeoVim, then you must move this file to `.config/nvim` in 
  your home folder, and rename the file to `init.vim`. Then, create a soft link 
  to `init.vim` in your home folder as follows:
  ``
  ls -s .config/nvim/init.vim .vimrc
  ``

