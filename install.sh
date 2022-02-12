rm -f ~/.vimrc ~/.zshrc ~/.myrc ~/.tmux.conf

cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/
if [ ! -f zsh-256color ]; then
	git clone https://github.com/chrissicool/zsh-256color
        git clone https://github.com/zsh-users/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting
fi


for FILE in vimrc zshrc myrc tmux.conf
do
	ln -s ~/my-dot-files/$FILE ~/.$FILE
done
