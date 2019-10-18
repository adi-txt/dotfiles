# ~/.bashrc: executed by bash(1) for non-login shells
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Add timestamp to history
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S "

#append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more aliases
alias ll='ls -la'
alias la='ls -A'
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
alias n='nvim'
alias f='nvim'
alias vi='nvim'
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
alias vc='python3 -m venv venv'
alias va='source venv/bin/activate'
alias vd='deactivate'
alias pr='pip install -r requirements.txt'
alias pu='pip install --upgrade pip'
alias brave='open -a "Brave Browser"'
alias pepify='autopep8 --in-place --aggressive --aggressive'
alias todo='n ~/repos/notes/thingstodo.md'
alias journal='n ~/repos/notes/.journal/2019/'
alias please='sudo'
alias vpnup='nmcli c up aws'
alias vpndown='nmcli c down aws'
alias dockerdestroy='docker system prune -a; docker rmi $(docker images -a -q)'
alias b='bpython3'
alias notes='cd ~/repos/personal/kepler-notes/2019/projects'
alias rearena='cd ~/repos/personal/re.are.na; source venv/bin/activate; make email'
alias bat='bat -n'
alias fn='n -o `fzf`'
alias fh='history | fzf'

if [ -f ~/.bash/sensitive ]; then
    . ~/.bash/sensitive
fi

# set copy/paste helper functions
# the per1 step removes the final newline from the output
alias pbcopy="per1 -pe 'chomp if eof' | xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

fzf-down() {
  fzf --height 50% "$@" --border
}

# reload bashrc
so() {
  source ~/.bashrc
}

############################################
# Colors
COLOR_LIGHT_BLUE="\033[38;5;86m"
COLOR_LIGHT_ORANGE="\033[38;5;215m"
COLOR_RESET="\033[0m"
BOLD="$(tput bold)"
COLOR_RED=`tput setaf 1`
COLOR_GREEN=`tput setaf 2`
c_sgr0=`tput sgr0`

# helper function for branch color
branch_color() {
    if git rev-parse --git-dir >/dev/null 2>&1
    then
        color=""
        if git diff --quiet 2>/dev/null >&2
        then
            color=${COLOR_GREEN}
        else
            color=${COLOR_RED}
        fi
    else
        return 0
    fi
    echo -n $color
}

# helper function to display current branch
git_branch() {
    if git rev-parse --git-dir >/dev/null 2>&1
    then
        gitver="["$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')"]"
    else
        return 0
    fi
echo -e $gitver
}

## Set Bash PS1
PS1_DIR="\[$BOLD\]\[$COLOR_LIGHT_ORANGE\]\w "
PS1_GIT="\[$BOLD\]\[\$(branch_color)\]\[$BOLD\]\$(git_branch)\[$COLOR_RESET\]"

# if [ "$(branch_color)" = "${COLOR_GREEN}" ]; then
#   PS1_GIT="\[$BOLD\]\[\$(branch_color)\]\[$BOLD\]\$(git_branch)\[$COLOR_RESET\]✔️ "
# elif [ "$(branch_color)" = "${COLOR_RED}" ]; then
#   PS1_GIT="\[$BOLD\]\[\$(branch_color)\]\[$BOLD\]\$(git_branch)\[$COLOR_RESET\]‼️ "
# else
#   PS1_GIT="\[$BOLD\]\[\$(branch_color)\]\[$BOLD\]\$(git_branch)\[$COLOR_RESET\]"
# fi

PS1_USR="\n\[$BOLD\]\[$COLOR_LIGHT_BLUE\]\u"
PS1_END="\[$BOLD\]\[$COLOR_LIGHT_BLUE\]\n\n🤔🤔🤔  \[$COLOR_RESET\]"
PS1="${PS1_USR} ${PS1_DIR}\
${PS1_GIT} ${PS1_END}"

#######################

# Bash-it Brunton theme to be edited at some point

# SCM_THEME_PROMPT_PREFIX=""
# SCM_THEME_PROMPT_SUFFIX=""
#
# SCM_THEME_PROMPT_DIRTY=" ${bold_red}✗${normal}"
# SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓${normal}"
# SCM_GIT_CHAR="${bold_green}±${normal}"
# SCM_SVN_CHAR="${bold_cyan}⑆${normal}"
# SCM_HG_CHAR="${bold_red}☿${normal}"
#
# is_vim_shell() {
# 	if [ ! -z "$VIMRUNTIME" ]
# 	then
# 		echo "[${cyan}vim shell${normal}]"
# 	fi
# }
#
# scm_prompt() {
# 	CHAR=$(scm_char)
# 	if [ $CHAR = $SCM_NONE_CHAR ]
# 	then
# 		return
# 	else
# 		echo " $(scm_char) (${white}$(scm_prompt_info)${normal})"
# 	fi
# }
#
# prompt() {
#   PS1="${white}${background_blue} \u${normal}${background_blue}@${red}${background_blue}\h $(clock_prompt) ${reset_color}${normal} $(battery_charge)\n${bold_black}${background_white} \w ${normal}$(scm_prompt)$(is_vim_shell)\n${white}>${normal} "
# }
#
# THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$blue$background_white"}
# THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-" %H:%M:%S"}
#
# safe_append_prompt_command prompt

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#PYENV installation
PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ]
then
  export PYENV_ROOT
  PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Enabling global terminal colors on macosx
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# git diff configuration
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true
git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

# bat config
export BAT_THEME='zenburn'

# Make sure you're also exporting PATH somewhere...
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH=~/.local/bin:$PATH

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
