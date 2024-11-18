#
# ~/.bashrc
#
source ~/shell_config/functions/flutter_watch/flutter-watch-function.sh
source ~/shell_config/functions/hot_reload/hot-reload-function.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias tree="find .  | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias ping="ping google.com"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias c='clear'

alias createTriFolder="sudo mkdir -p $HOME/Desktop/work $HOME/Desktop/kuliah/SEM5 $HOME/Desktop/belajar"
alias workdir="cd $HOME/Desktop/work"
alias kuliah="cd $HOME/Desktop/kuliah/SEM5"
alias belajar="cd $HOME/Desktop/belajar"

SHELL_CONFIG_FEATURES=$HOME/.shell_config_features.sh
source $SHELL_CONFIG_FEATURES

source $HOME/.user-config.sh

export PS1="
\[\e[38;5;10m\]\u\[\e[38;5;10m\]@\[\e[38;5;10m\]\h \[\e[38;5;14m\]\t
\[\e[38;5;11m\]\w \[\e[38;5;13m\]\$(git branch 2>/dev/null | grep '^*' | colrm 1 2) \[\e[38;5;15m\]$ "

# # A while loop with a pipeline (e.g., find | while) runs in a subshell, so any changes made, like sourcing files, remain confined to that subshell and don't affect the parent shell. A for loop, on the other hand, executes directly in the current shell, so sourced files can modify the current shell's environment (e.g., variables, aliases).
# for file in $(find "$SEARCH_DIR" -type f -name "*.sh"); do
#   # echo "Sourcing $file"
#   source "$file"
# done
