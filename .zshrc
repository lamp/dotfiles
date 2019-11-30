# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lambda"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  brew
  lein
  last-working-dir
  osx
  fzf
  history
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
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
eval "$(rbenv init -)"

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

if [ -f /Users/matthew.gradidge/work/devtools/.source ]; then
  source /Users/matthew.gradidge/work/devtools/.source
fi

if [ -f /usr/local/opt/qt@5.5/bin ]; then
  export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
  export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
fi

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

alias be='bundle exec'

CVSEEDS_PATH="~/work/cvseeds"
function cv () {
  # example cv staging vault
  # Usage cv stage vault_or_consul env
  ENV="us"
  if [[ -v $3 ]]
  then
    ENV=$3
  fi

  typeset -A envs
  envs=("us" "us-east-1" "uk" "eu-west-1" "ce" "eu-central-1")

  cat "$CVSEEDS_PATH/$envs[$ENV]/$1/$2.yaml" | fzf
}

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
