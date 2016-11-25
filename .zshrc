source "$HOME/.files/lib/globals"

local plugins
plugins=(
  git
  bundler
  gem
  ruby
  rails
  vi-mode
  fasd
)

# Sometimes carriage returns are ^M.  Specify that it's a return
stty icrnl

# Let Zsh use vim bindings
bindkey -v

# Vi-mode breaks this default configuration.  Adding manually
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

source $ZSH/oh-my-zsh.sh
source "$DOTFILES_ROOT/script/setups/shell"
source "$DOTFILES_ROOT/script/setups/aliases"

source $HOME/.zshenv

# Source iterm2 shell integration if available
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
