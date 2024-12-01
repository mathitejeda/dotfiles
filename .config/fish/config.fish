if status is-interactive
    # Commands to run in interactive sessions can go here
	#tmux abbrs
	abbr tl 'tmux ls'
	abbr ta 'tmux attach -t'
	abbr tn 'tmux new -s'
	abbr tk 'tmux kill-session -t'
	abbr tkss 'tmux kill-server'
end
