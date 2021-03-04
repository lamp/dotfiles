# print all the things
set -x
# Install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
# Copy zsh config
ln -sFv "$(pwd)/.zshrc" ~/.zshrc

# install zsh dependencies
zplug install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Install neovim
brew install neovim
# Copy neovim config file
mkdir ~/.config/
ln -sFv "$(pwd)/nvim/init.vim" ~/.config/nvim/init.vim
# alacritty config
ln -sFv "$(pwd)/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml

ln -sFv "$(pwd)/.gitignore" ~/.gitignore

ln -sFv "$(pwd)/.tmux.conf" ~/.tmux.conf 

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install scm breeze
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh

# Install rustup
curl https://sh.rustup.rs -sSf | sh

# install leiningen
brew install leiningen
# Install clojure config
ln -sFv "$(pwd)/shadow-cljs/config.edn" ~/.shadow-cljs/config.edn
ln -sFv "$(pwd)/lein/profiles.clj" ~/.lein/profiles.clj

# Install joker
brew install joker
brew install clj-kondo
# Scripting in clojure
brew install borkdude/brew/babashka
# misc
brew install rbenv
brew install ruby-build
brew install pyenv
brew install autojump
brew install ctags
brew install direnv
ln -sFv "$(pwd).ctags" .ctags

# ensure system ruby is a recent version
rbenv install 2.7.1
rbenv global 2.7.1

# ruby language server
sudo gem install solargraph
# install neovim dependencies
nvim -s vim-commands.txt

# install tmux and tpm
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
gem install tmuxinator
ln -sFv "$(pwd)/tmux.conf" ~/.tmux.conf

source ~/.zshrc
# Finish
print Done!
