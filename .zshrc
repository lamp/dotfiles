unsetopt inc_append_history
unsetopt share_history

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
