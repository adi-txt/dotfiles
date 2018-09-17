# 🛠  dotfiles

This repository contains my configuration files for Bash, Git, Tmux, and Vim.

Here are instructions on how to utilize said files:

1. `.bashrc`
  - This needs to be placed in your home folder and sourced to be activated.
  - Ideally though, you create a soft link from your fork/repository to 
  your home folder. This can be done as follows, assuming your dotfiles 
  repository is in your home directory:
```
  ln -s dotfiles/.bashrc .bashrc
```
  - Sourcing the new `.bashrc` file can be done as follows:
  ```
  source ~/.bashrc
  ```

2. `.bash_profile`
  - This only needs to be placed in your home folder if you are working 
  on macOS.
  - This also can be soft linked from your dotfiles folder:
```
  ln -s dotfiles/.bash_profile .bash_profile
```

3. `.gitconfig`
  - This also needs to be placed in your home folder or soft linked as 
  follows:
```
  ln -s dotfiles/.gitconfig .gitconfig
```
  - Additionally, you will need to edit your email and name here to 
  match your own GitHub profile's email and name. And you need to have 
  git installed..

![Alt Text](https://media.giphy.com/media/v3ptWNDUNipVe/giphy.gif)

4. `.tmux.conf`
  - This also goes into your home folder or is soft linked as follows:
```
  ln -s dotfiles/.tmux.conf .tmux.conf
```
  - Also this would only work if you've installed Tmux, which can be 
  done by following instructions [here](https://hackernoon.com/a-gentle-introduction-to-tmux-8d784c404340).

5. `.vimrc`
  - This needs to be placed in your home folder if you are using Vim.
  - If you choose to use NeoVim, however, then you must move this file to 
  `.config/nvim` in your home folder, and rename the file to `init.vim`. 
  Then, create a soft link to `init.vim` in your home folder as follows:
  ```
  ls -s .config/nvim/init.vim .vimrc
  ```
