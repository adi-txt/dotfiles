# Path to your oh-my-zsh installation.
export ZSH="/Users/adi/.oh-my-zsh"

ZSH_THEME="spaceship"

# Spaceship customizations; all colors are low contrast on purpose
SPACESHIP_DIR_COLOR="73" # blue
SPACESHIP_CHAR_COLOR_SUCCESS="65" # green

SPACESHIP_GIT_BRANCH_COLOR="179" # orange

SPACESHIP_GIT_STATUS_COLOR="173" # red
SPACESHIP_DIR_LOCK_COLOR="173" # red
SPACESHIP_CHAR_COLOR_FAILURE="173" # red
SPACESHIP_TIME_COLOR="173" # red

SPACESHIP_VENV_COLOR="228" # yellow
SPACESHIP_CHAR_COLOR_SECONDARY="228" # yellow

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

if [ -f ~/.bash/sensitive ]; then
    . ~/.bash/sensitive
fi

# set copy/paste helper functions
# the per1 step removes the final newline from the output
alias pbcopy="per1 -pe 'chomp if eof' | xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

alias ll='ls -la'
alias l='ls -CF'
alias ,='cd ..'
alias ,,='cd ../..'
alias ,,,='cd ../../..'
alias ,,,,='cd ../../../..'
alias ,,,,,='cd ../../../../..'
alias ,,,,,,='cd ../../../../../..'
alias ,,,,,,,='cd ../../../../../../..'
alias ,,,,,,,,='cd ../../../../../../../..'
alias ,,,,,,,,,='cd ../../../../../../../../..'
alias d='cd'
alias n='nvim'
alias f='nvim'
alias vim='nvim'
alias p='python3'
alias c='clear'
alias ga='git add .'
alias gp='git push origin master'
alias gpo='git push origin'
alias gs='git status'
alias gd='git diff'
alias gc='git commit -m'
alias gl='git lgr'
alias gpu='git pull'
alias vc='python3 -m venv .venv'
alias va='source .venv/bin/activate'
alias vd='deactivate'
alias pr='pip install -r requirements.txt'
alias pu='pip install --upgrade pip'
alias brave='open -a "Brave Browser"'
alias pepify='autopep8 --in-place --aggressive --aggressive'
alias todo='n ~/repos/notes/thingstodo.md'
alias journal='cd ~/repos/notes/.journal; n 2020/'
alias please='sudo'
alias vpnup='nmcli c up aws'
alias vpndown='nmcli c down aws'
alias dockerdestroy='docker system prune -a; docker rmi $(docker images -a -q)'
alias b='bpython3'
alias notes='cd ~/repos/personal/kepler-notes/2019/projects'
alias rearena='cd ~/repos/personal/re.are.na; source venv/bin/activate; make email'
alias bat='bat -n'
alias fh='history | fzf'
alias zshrc='n ~/.zshrc'
alias so='source ~/.zshrc'
alias bashrc='n ~/.bashrc'
alias vimrc='n ~/.vimrc'
alias ds='rm -rf .DS_Store'

# Enabling global terminal colors on macosx
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LS_COLORS=$LS_COLORS:'ln=\e[38;2;95;135;95;1'
export LS_COLORS=$LS_COLORS:'di=\e[38;2;95;175;175;1'
export LS_COLORS=$LS_COLORS:'ex=\e[38;2;215;135;95;1'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#PYENV installation
PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ]
then
  export PYENV_ROOT
  PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# bat config
export BAT_THEME='zenburn'

# Make sure you're also exporting PATH somewhere...
export PATH=$PATH:~/bin
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH=~/.local/bin:$PATH

. $HOME/.asdf/asdf.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
