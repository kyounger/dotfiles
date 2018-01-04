if [ -z ${MACHINE_CONFIG_TYPE+x} ]; then 
    if [[ ! -a /etc/zshenv ]]; then
        sudo sh -c "touch /etc/zshenv"
    fi
    sudo sh -c "echo '#ensure this is set properly for this machine' >> /etc/zshenv"
    sudo sh -c "echo 'export MACHINE_CONFIG_TYPE=home' >> /etc/zshenv"
    sudo vim /etc/zshenv
    exit 1; 
else
    echo "MACHINE_CONFIG_TYPE=$MACHINE_CONFIG_TYPE";
fi

source /etc/zshenv


echo env HOME is: $HOME

cd $HOME

brew install zplug

#rm -f bin
ln -fs $HOME/.dotfiles/bin

#rm -f .gitignore
ln -fs $HOME/.dotfiles/git/.gitignore

#rm -f .gitconfig
ln -fs $HOME/.dotfiles/git/.gitconfig

#rm -f .jshintrc
ln -fs $HOME/.dotfiles/jshint/.jshintrc

#rm -f .sqliterc
ln -fs $HOME/.dotfiles/sqlite/.sqliterc

#rm -f .tmux.conf
ln -fs $HOME/.dotfiles/tmux/.tmux.conf

#rm -f .gvimrc
ln -fs $HOME/.dotfiles/vim/.gvimrc

#rm -f .vimrc
ln -fs $HOME/.dotfiles/vim/.vimrc

#rm -f .vim
ln -fs $HOME/.dotfiles/vim/.vim

#rm -f .vim
ln -fs $HOME/.dotfiles/vim/.ideavimrc

#rm -f .zshenv
# ln -fs $HOME/.dotfiles/.zshenv

#rm -f .zshrc
ln -fs $HOME/.dotfiles/.zshrc

mkdir -p $HOME/.config/brewfile
ln -fs $HOME/.dotfiles/Brewfile $HOME/.config/brewfile/Brewfile
ln -fs $HOME/.dotfiles/Brewfile.$MACHINE_CONFIG_TYPE $HOME/.config/brewfile/Brewfile.local


echo "You may want to re-run defaults: $HOME/.dotfiles/mathiasbynens-dotfiles/.macos"
