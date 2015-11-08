if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export CLICOLOR=1

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

alias chrome="open -a 'google chrome'"

#GROWLDATE=`date +"%A, %h %d %Y %H:%m:%S %Z"`
#alias growl=`growlnotify -a terminal -t "Process Complete" -m "${GROWLDATE}"
#`
