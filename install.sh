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

brew install kyounger/file/brew-file

ln -fs $HOME/.dotfiles/bin

cd $HOME/.dotfiles/brewfile/
ln -fs Brewfile.$MACHINE_CONFIG_TYPE Brewfile.local
cd $HOME

ln -fs $HOME/.dotfiles/jshint/.jshintrc

ln -fs $HOME/.dotfiles/sqlite/.sqliterc

ln -fs $HOME/.dotfiles/git/.gitconfig

ln -fs $HOME/.dotfiles/tmux/.tmux.conf

ln -fs $HOME/.dotfiles/vim/.gvimrc

ln -fs $HOME/.dotfiles/vim/.vimrc

ln -fs $HOME/.dotfiles/vim/.vim

ln -fs $HOME/.dotfiles/vim/.ideavimrc

ln -fs $HOME/.dotfiles/zsh/.zshenv
ln -fs $HOME/.dotfiles/zsh/.zshrc
ln -fs ~/.dotfiles/zsh/zsh-vim-mode ~/.zplugin/plugins/_local---zsh-vim-mode

echo "You may want to re-run defaults: $HOME/.dotfiles/mathiasbynens-dotfiles/.macos"
echo "Also, run brew file install"
