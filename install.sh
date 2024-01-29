

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s ~/my-dot-files/my.zsh-theme ~/.oh-my-zsh/themes/my.zsh-theme
cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/
if [ ! -f zsh-256color ]; then
	git clone https://github.com/chrissicool/zsh-256color
        git clone https://github.com/zsh-users/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting
fi
mv ~/.zshrc ~/.zshrc_bak
ln -s ~/my-dot-files/zshrc ~/.zshrc

# rm -f ~/.vimrc ~/.zshrc ~/.myrc ~/.tmux.conf
# for FILE in vimrc zshrc myrc tmux.conf
# do
# 	ln -s ~/my-dot-files/$FILE ~/.$FILE
# done
