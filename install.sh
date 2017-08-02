echo env HOME is: $HOME

cd $HOME

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

#rm -f .zlogin
ln -fs $HOME/.dotfiles/zsh/.zlogin

#rm -f .zlogout
ln -fs $HOME/.dotfiles/zsh/.zlogout

#rm -f .zprezto
ln -fs $HOME/.dotfiles/zsh/.zprezto

#rm -f .zpreztorc
ln -fs $HOME/.dotfiles/zsh/.zpreztorc

#rm -f .zprofile
ln -fs $HOME/.dotfiles/zsh/.zprofile

#rm -f .zshenv
ln -fs $HOME/.dotfiles/zsh/.zshenv

#rm -f .zshrc
ln -fs $HOME/.dotfiles/zsh/.zshrc

mkdir -p $HOME/.brewfile
ln -fs $HOME/.dotfiles/Brewfile $HOME/.brewfile/Brewfile
ln -fs $HOME/.dotfiles/Brewfile.work $HOME/.brewfile/Brewfile.work
ln -fs $HOME/.dotfiles/Brewfile.home $HOME/.brewfile/Brewfile.home

#run .osx defaults
$HOME/.dotfiles/mathiasbynens-dotfiles/.osx

sudo sh -c "echo '#ensure this is set properly for this machine' > /etc/zshenv"
sudo sh -c "echo 'export MACHINE_CONFIG_TYPE=home' >> /etc/zshenv"
sudo vim /etc/zshenv
