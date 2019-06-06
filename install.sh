# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Copy zsh config
ln -sFv ./.zshrc ~/.zshrc
# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Install neovim
brew install neovim
# Copy neovim config file
mkdir ~/.config/
ln -sFv ./nvim/init.vim ~/.config/nvim/init.vim
# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# install neovim dependencies
nvim -s vim-commands.txt
# install scm breeze
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
source ~/.zshrc
# install leiningen
brew install leiningen
# Install joker
brew install joker
# misc
brew install rbenv
brew install pyenv
brew install autojump
# Finish
print Done!
