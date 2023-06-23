#!/bin/bash
languages=`echo "java cpp golang bash zsh shell" | tr ' ' '\n'`
core_utils=`echo "find sed echo printf awk" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "query: " query

# Attach to the existing tmux session
window_count=$(tmux list-windows | wc -l)
if printf $languages | grep -qs $selected; then
	tmux neww -t $window_count -n $selected/$query zsh -c "curl cht.sh/$selected/$(echo "$query" | tr ' ' '+') & while [ : ]; do sleep 1; done"
else
	tmux neww -t $window_count -n $selected/$query zsh -c "curl -s cht.sh/$selected~$query | less"
fi
