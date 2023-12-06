#!/bin/zsh
# A script that automatically configures TexLive, TikZiT and Typst.

RC_FILE=~/.zshrc

sudo apt update
sudo apt install xauth tikzit -y

# the TexLive version is 2019.
tlmgr init-usertree
tlmgr option repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2019/tlnet-final
tlmgr install braket --verify-repo=none

# Typst
# mkdir ~/typst/
# wget https://github.com/typst/typst/releases/download/v0.10.0/typst-x86_64-unknown-linux-musl.tar.xz
# tar -xf typst-x86_64-unknown-linux-musl.tar.xz -C ~/typst/ --strip-components=1
# echo "export PATH=~/typst:\$PATH" >> $RC_FILE
# source $RC_FILE
# rm typst-x86_64-unknown-linux-musl.tar.xz

code --install-extension nvarner.typst-lsp
code --install-extension mgt19937.typst-preview

sudo apt install pdf2svg -y

p2svg='
p2svg(){
    while true
    do
        while test ! -e figs/tikzit_image0.pdf
        do
            sleep 1
        done

        most_recent_file=$(find figs -type f -name "*.tikz" -exec ls -t {} + | head -n1)

        new_file_name=${most_recent_file:0:-4}svg
        echo "Renaming to $new_file_name"
        pdf2svg figs/tikzit_image0.pdf "$new_file_name"
        rm figs/tikzit_image0.pdf
    done
}'

echo $p2svg >> $RC_FILE

source $RC_FILE

