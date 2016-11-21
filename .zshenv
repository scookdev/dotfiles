# Jump back into vim with Ctrl-Z
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# set up rbenv
# eval "$(rbenv init -)"
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

export GOPATH=~/dev/go
export PATH="/usr/local/bin:$PATH"

alias vim="nvim"
alias vi="nvim"
alias vimrc="vim ~/.vimrc"

alias gppf="git push --force-with-lease"
# "Git Nuke" deletes everything but current branch
alias gnuke="git branch | grep -v '^*' | xargs git branch -D "
alias gca="git commit --amend --no-edit"
function gppr {
  git fetch --prune && git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D
}
alias gs="git status"

alias be="bundle exec"

function gclone(){ git clone git@github.com:$1/$2.git; cd $(basename $2); }

