source ~/.zplug/init.zsh
zplug "plugins/git",   from:oh-my-zsh, defer:2
zplug "plugins/brew",   from:oh-my-zsh, defer:2
zplug "plugins/lein",   from:oh-my-zsh, defer:2
zplug "plugins/last-working-dir",   from:oh-my-zsh, defer:2
zplug "plugins/osx",   from:oh-my-zsh, defer:2
zplug "plugins/fzf",   from:oh-my-zsh, defer:2
zplug "plugins/history",   from:oh-my-zsh, defer:2
zplug "plugins/zsh-autosuggestions",   from:oh-my-zsh, defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2

zplug 'themes/lambda', as:theme, from:oh-my-zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

if [ -f ~/vars.sh ]; then
  source ~/vars.sh
fi

export PATH="/usr/local/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

function reup() {
  source ~/.zshrc
}

# Ensure Postgres and Kafka tooling is available on the PATH
export PATH="$PATH:/usr/local/Cellar/postgresql@9.6/9.6.8/bin/"
export PATH="$PATH:/Users/matthew.gradidge/confluent/bin"

# RBenv init
if [[ -f /usr/local/bin/rbenv ]]; then
  eval "$(rbenv init -)"
fi

# Disable shared history between tabs and panes
unsetopt inc_append_history
unsetopt share_history
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

# make fzf respect gitignore
export FZF_DEFAULT_COMMAND='fd -H --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Always use homebrew openssl
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

if [ -f /Users/matthew.gradidge/work/devtools/.source ]; then
  source /Users/matthew.gradidge/work/devtools/.source
fi

if [ -f /usr/local/opt/qt@5.5/bin ]; then
  export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
  export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
fi

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

alias be='bundle exec'

function puma-stat () {
  # Requires jq to be installed
  local ddd
  for top in topologies-loan-settled task-mux-product-unit-updates task-product-unit-updates view-builders-us-investor-api-holdings topologies-loan-part-repayment-reverser topologies-create-predetermined-repayments topologies-late-fees-laminar-translator
  do
    output=$(curl -s -H "Accept: application/json" "https://$top-product-unit-manager.fc-prod.us")
    ddd+="$top $(echo $output | jq '.["server-status"].status')\n"
  done

  echo $ddd | column -t

}

function cmdk () {
  clear && printf '\e[3J'
}


eval "$(direnv hook zsh)"

export OKTA_USERNAME=matthew.gradidge
okta() {
   if [ -z "$1" ]; then
     echo "ERROR => specify profile"
   else
     /usr/local/bin/okta_aws -u $OKTA_USERNAME -e https://fundingcircle.okta.com/home/amazon_aws/0oa9dw16cdiT5Hntw0x7/272 -p "$1" -s admin-in-$1 && \
     source ~/.aws/.aws_env_$1
     echo "Successfully configured AWS credentials for profile: $1"
   fi
 }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias iced='~/.local/share/nvim/plugged/vim-iced/bin/iced'

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Rustup config
source $HOME/.cargo/env

[ -s "/Users/matt/.scm_breeze/scm_breeze.sh" ] && source "/Users/matt/.scm_breeze/scm_breeze.sh"

# Shopify
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

export ARTIFACTORY_PASSWORD=AKCp8ihLAaxtxxGYphASMfm7zhFzBHqN9SsiLGbofzUMsog9uWziLEV2YECCcrRvZSnieNXAc
export ARTIFACTORY_USER=matthew.gradidge@fundingcircle.com
