#!/bin/zsh
# A script that automatically configures TexLive, TikZiT and Typst.

RC_FILE=~/.zshrc
sudo chsh "$(id -un)" --shell "/usr/bin/zsh"

sudo apt update
sudo apt install xauth -y

mkdir tmp
cd tmp

# TeXLive
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -

# https://ctan.org/mirrors/mirmon
sudo perl install-tl-20*/install-tl --no-interaction --scheme=basic --repository https://mirror-hk.koddos.net/CTAN/systems/texlive/tlnet

echo "export PATH=/usr/local/texlive/2023/bin/x86_64-linux:\$PATH" >> $RC_FILE


# TikZiT
mkdir ~/tikzit/
wget https://github.com/tikzit/tikzit/releases/download/v2.1.6/tikzit-linux.tar.gz
tar -xvzf tikzit-linux.tar.gz -C ~/tikzit/ --strip-components=1
echo "export PATH=~/tikzit/bin:\$PATH" >> $RC_FILE

sudo apt install libgl1 libqt5core5a libqt5gui5 -y

# Typst
# mkdir ~/typst/
# wget https://github.com/typst/typst/releases/download/v0.10.0/typst-x86_64-unknown-linux-musl.tar.xz
# tar -xf typst-x86_64-unknown-linux-musl.tar.xz -C ~/typst/ --strip-components=1
# echo "export PATH=~/typst:\$PATH" >> $RC_FILE

# Clean-up
cd ..
rm -rf tmp

# Additional setup
sudo /usr/local/texlive/2023/bin/x86_64-linux/tlmgr install pgf preview mathtools braket
# wget https://tikzit.github.io/tikzit.sty


code --install-extension nvarner.typst-lsp
code --install-extension mgt19937.typst-preview

sudo apt install pdf2svg -y
p2svg='p2svg(){
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


