if status is-interactive
    # Commands to run in interactive sessions can go here
	set -g fish_key_bindings fish_vi_key_bindings

	# add gopath
	set -x GOPATH $HOME/go
	set -x PATH $PATH $GOPATH/bin

	#tmux abbrs
	abbr tl 'tmux ls'
	abbr ta 'tmux attach -t'
	abbr tn 'tmux new -s'
	abbr tk 'tmux kill-session -t'
	abbr tkss 'tmux kill-server'

	fzf --fish | source
end
