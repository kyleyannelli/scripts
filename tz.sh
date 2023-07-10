#!/bin/zsh

source ~/.oh-my-zsh/plugins/z/z.plugin.zsh

# Make sure the query has been passed
if [[ -z "$1" ]]; then
	echo "Please provide a directory to go into. Ex: tz KMusicBot"
	exit 1
fi

# use z to find the most recent with -e which just prints it
directory=$(zshz -e "$1")

# Check that something was actually found
if [[ -z "$directory" ]]; then
	echo "No directory found via query, $1"
	exit 1
fi

# basename is a cool tool that just extracts the final part of a dir
window_name=$(basename $directory)

# Now create a new tmux window
# First, make sure it doesn't already exist
if tmux list-windows -F '#{window_name}' | grep -q "^$window_name$"; then
	tmux select-window -t "$window_name"
else
	tmux new-window -c "$directory" -n "$window_name"
fi

