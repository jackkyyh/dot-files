# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
#[[ -s ${HOME}/.autojump/etc/profile.d/autojump.sh ]] && source ${HOME}/.autojump/etc/profile.d/autojump.sh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="my"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(zsh-autosuggestions git zsh-256color zsh-syntax-highlighting )
# if [[ -n $SSH_CONNECTION && ! -n $TERM_PROGRAM ]]; then
#     ZSH_TMUX_AUTOCONNECT=true
#     ZSH_TMUX_AUTOSTART=true
#     plugins+=(tmux)
# fi

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# . ~/.myrc


# function zle-line-init zle-keymap-select {
# 	zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select
# VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
# RPS1='${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$EPS1'
# export KEYTIMEOUT=1

# bindkey -v

# if [[ "$OSTYPE" = "darwin"* ]]; then
#     export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
# fi

# if [[ $TERM_PROGRAM == 'vscode' ]]; then
#     echo 'Welcome to zsh in vscode.'
# elif [[ -n $SSH_CONNECTION ]]; then
#     if [[ ! -n $TMUX  ]]; then
#         # else
#             # neofetch
            
#             RANDOM=$$
#             echo "\n\e[0;$(($(($RANDOM%6))+30))m"
#             # echo "\tIMPORTANT: "
#             # echo "\tTmux is no longer launched automatically. "
#             # echo "\tPlease evoke it manually."
#             echo -e -n "         \e[0;$(($(($RANDOM%6))+31))m Press any key to continue...  "   # Display prompt in red
#             read -q -s key </dev/tty
#             echo -e "\n         \e[0;$(($(($RANDOM%6))+30))m Evoking tmux..."
#             echo -e -n '\e[0;0m'                    # Turn off coloured output
#         # fi
#     fi
# fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/data/jackkyyh/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/data/jackkyyh/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/data/jackkyyh/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/data/jackkyyh/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<


# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
