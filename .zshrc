source "/$HOME/.files/lib/globals"

local plugins
plugins=(
  git
  bundler
  gem
  ruby
  rails
  vi-mode
  autojump
)

# Sometimes carriage returns are ^M.  Specify that it's a return
stty icrnl

# Let Zsh use vim bindings
bindkey -v

source $ZSH/oh-my-zsh.sh
source "$DOTFILES_ROOT/script/setup/shell"

# aliases are sourced here to use in vim
source $HOME/.zshenv
