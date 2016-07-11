cd ~

#rm -f bin
ln -fs .dotfiles/bin

#rm -f .gitignore
ln -fs .dotfiles/git/.gitignore

#rm -f .gitconfig
ln -fs .dotfiles/git/.gitconfig

#rm -f .jshintrc
ln -fs .dotfiles/jshint/.jshintrc

#rm -f .sqliterc
ln -fs .dotfiles/sqlite/.sqliterc

#rm -f .tmux.conf
ln -fs .dotfiles/tmux/.tmux.conf

#rm -f .gvimrc
ln -fs .dotfiles/vim/.gvimrc

#rm -f .vimrc
ln -fs .dotfiles/vim/.vimrc

#rm -f .vim
ln -fs .dotfiles/vim/.vim

#rm -f .zlogin
ln -fs .dotfiles/zsh/.zlogin

#rm -f .zlogout
ln -fs .dotfiles/zsh/.zlogout

#rm -f .zprezto
ln -fs .dotfiles/zsh/.zprezto

#rm -f .zpreztorc
ln -fs .dotfiles/zsh/.zpreztorc

#rm -f .zprofile
ln -fs .dotfiles/zsh/.zprofile

#rm -f .zshenv
ln -fs .dotfiles/zsh/.zshenv

#rm -f .zshrc
ln -fs .dotfiles/zsh/.zshrc

#run .osx defaults
~/.dotfiles/mathiasbynens-dotfiles/.osx
