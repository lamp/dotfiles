# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Copy zsh config
ln -sFv "$(pwd)/.zshrc" ~/.zshrc
# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Install neovim
brew install neovim
# Copy neovim config file
mkdir ~/.config/
ln -sFv "$(pwd)/nvim/init.vim" ~/.config/nvim/init.vim
# alacritty config
ln -sFv "$(pwd)/alacritty" ~/.config/alacritty/alacritty.yml

ln -sFv "$(pwd)/.gitignore" ~/.gitignore

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install scm breeze
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
source ~/.zshrc

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
# misc
brew install rbenv
brew install ruby-build
brew install pyenv
brew install autojump

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
# Finish
print Done!
