#######################################################################################################
# .zshr

#######################################################################################################
# LANG configration
#
export LANG=C

case "${OSTYPE}" in
linux*|darwin*)
	LANG=ja_JP.UTF-8
	;;
esac

case ${UID} in
0)
	LANG=C
	;;
esac

#######################################################################################################
# Alias configration
#
case "${OSTYPE}" in
freebsd*|darwin*)
	alias ls="ls -G -w"
	;;
linux*)
	alias ls="ls --color"
	;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -lAF"
alias vi="${EDITOR}"

#######################################################################################################
# Command history configuration
#
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

#######################################################################################################
# Shell configuration (option)
#
setopt auto_cd             # auto change directory
setopt auto_pushd          # auto directory pushd that you can get dirs list by cd -[tab]
setopt hist_ignore_dups    # ignore duplication command history list
setopt share_history       # share command history data

#######################################################################################################
# Predict configuration
#
#autoload predict-on
#predict-on

#######################################################################################################
# Keybind configuration
#
#bindkey -v                # vi like keybind

# histrical backword/forward search with linehead string binded to ^P/^N
#autoload history-search-end

#zle -N history-beginning-search-backword-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#bindkey "^P" history-beginning-search-backword-end
#bindkey "^N" history-beginning-search-forward-end

#######################################################################################################
# Completion configuration
#
fpath=(~/.zsh $fpath)      # path to 'git-completion'

autoload -U compinit
autoload -U colors

compinit
colors

setopt correct             # command correct edition before each completion attempt
setopt complete_in_word    # enable tab completion in word
setopt complete_aliases    # aliased Ls needs if file/dir completions work
setopt list_packed         # compacked complete list display
setopt nolistbeep          # no beep sound when complete list displayed

zstyle ':completion:*' list-colors "${LS_COLORS}"    # color the completion candidates
zstyle ':completion:*:default' menu select=1         # highlight the completion candidates
zstyle ':completion::complete:*' use-cache true      # enable use cache
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # case insensitive

#######################################################################################################
# Git prompt
#
setopt prompt_subst

if [ -f ${HOME}/.zsh/git-prompt.sh ]; then
	source ${HOME}/.zsh/git-prompt.sh
	
	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWUNTRACKEDFILES=true
	GIT_PS1_SHOWSTASHSTATE=true
	GIT_PS1_SHOWUPSTREAM=auto
fi

#######################################################################################################
# Prompt configuration
#
PROMPT='%F{green}%n@%m%f:%F{cyan}%~%f %F{blue}$(__git_ps1)%f
%#> '
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "


#######################################################################################################
# load user .zshrc configuration file
#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
