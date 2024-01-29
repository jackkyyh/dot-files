
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install theme
ln -s ~/my-dot-files/custom.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/custom.zsh-theme

# Install plugins
cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/
if [ ! -f zsh-256color ]; then
	git clone https://github.com/chrissicool/zsh-256color
        git clone https://github.com/zsh-users/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting
fi

# Install zshrc
mv ~/.zshrc ~/.zshrc_bak
ln -s ~/my-dot-files/zshrc ~/.zshrc

# Install custom.zsh
ln -s ~/my-dot-files/custom.zsh ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/custom.zsh



# rm -f ~/.vimrc ~/.zshrc ~/.myrc ~/.tmux.conf
# for FILE in vimrc zshrc myrc tmux.conf
# do
# 	ln -s ~/my-dot-files/$FILE ~/.$FILE
# done
