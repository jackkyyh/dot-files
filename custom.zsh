#! /bin/zsh

if [[ "$HOST" = *"gpugate1" || "$HOST" = *"gpu2gate1" ]]; then
    export PATH=$HOME/.local/bin:$PATH
    alias gpu-interactive="srun --gres=gpu:1 --cpus-per-task=4 --pty sh -c 'echo Node ip: \$(hostname -I); zsh'"
    alias gpu-interactive-3090="srun -p q3090 --gres=gpu:rtx3090:2 --cpus-per-task=8 --pty sh -c 'echo Node ip: \$(hostname -I); zsh'"
elif [[ "$OSTYPE" = "darwin"* ]]; then
    alias enable_proxy="export ALL_PROXY=socks5://127.0.0.1:7890"
    alias disable_proxy="unset ALL_PROXY"
    # export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
    eval "$(/opt/homebrew/bin/brew shellenv)"
    alias alist="cd ~/alist;./alist server"
fi

alias untar="tar -xvf"

alias vimrc="vim ~/.vimrc"
alias customrc="vim "$0

# bindkey -v
# bindkey '^P' up-history
# bindkey '^N' down-history
bindkey '^w' backward-kill-word
bindkey '^o' beginning-of-line
bindkey '^a' end-of-line


# my_latex(){
#     if [ ! -f ${1}.tex ]; then
#         echo "File ${1}.tex not found"
#         return 1
#     fi;

#     while true;
#     do
#             sleep 1;
#             if [ ! -f ${1}.log ] || [ ${1}.tex -nt ${1}.log ]
#             then
#                     pdflatex -halt-on-error -file-line-error ${1}.tex;
#                     echo "new version at " `date +%T`
#             fi;
#     done
# }

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
