alias ls='ls --color=auto'
export TERM=xterm-256color

source ~/.git-prompt.sh

# shorten after 4 path segments in prompt
PROMPT_DIRTRIM=4

# add colorization and git branch in prompt
PROMPT_BEFORE='[\u@\h \[\033[0;34m\]\w\[\033[0m\]'
PROMPT_AFTER=']\$ '
PROMPT_COMMAND='__git_ps1 "$PROMPT_BEFORE" "$PROMPT_AFTER" " \[\033[0;31m\]%s\[\033[0m\]"'
