if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export CLICOLOR=1

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,bash_aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Git tab autocompletion
source ~/.git-completion.bash

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Go ROOT path
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export HOMEBREW_GITHUB_API_TOKEN=b1aa72c0bc7a8d2d9d0951c9f711fc142486d1f1

# set up autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
