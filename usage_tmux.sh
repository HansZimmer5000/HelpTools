#!/bin/bash

SESSION="work"

setup_windows_and_panes(){
    tmux kill-session -t "$SESSION"
    tmux new-session -d -s "$SESSION"

    for input in "$@"; do
        pane="$(echo "$input" | cut -d':' -f1)"
        split_type="$(echo "$input" | cut -d':' -f2)"
        tmux split-window -"$split_type" -t "$SESSION":"$pane"
    done
}

enter_commands(){
    for input in "$@"; do
        pane="$(echo "$input" | cut -d':' -f1)"
        command="$(echo "$input" | cut -d':' -f2)"
        tmux send-keys -t "$SESSION":"$pane" "$command" Enter
    done
}

attach_session(){
    tmux attach-session -t "$SESSION"
}

setup_windows_and_panes "0.0:v"
enter_commands "0.0:energyWatch.sh" "0.1:htop"
attach_session

note(){
    :

    #setup_windows_and_panes "0.0:h" "0.1:v"
    # Creates Tmux session like:
    # -------------------------
    # |           | <pane0.1> |
    # | <pane0.0> |-----------|
    # |           | <pane0.2> |
    # -------------------------
    
    #setup_windows_and_panes "0.0:h" "0.1:v" "0.0:v"
    # Creates Tmux session like:
    # -------------------------
    # | <pane0.0> | <pane0.2> |
    # |-----------|-----------|
    # | <pane0.1> | <pane0.3> |
    # -------------------------
}