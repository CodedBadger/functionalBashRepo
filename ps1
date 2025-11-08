# Customize the prompt#
NOTPS1='\[\033[1;32m\]\u@\h \[\033[1;34m\]\w\[\033[1;33m\]$( [ -d .git ] || git rev-parse --git-dir >/dev/null 2>&1 && echo " [$(parse_git_branch)]")\[\033[0m\] \$ '
PS1='\[\033[1;32m\][\u]\[\033[0m\]: \[\033[1;34m\]${PWD##*/}\[\033[1;33m\]$( [ -d .git ] || git rev-parse --git-dir >/dev/null 2>&1 && echo " [$(parse_git_branch)]")\[\033[0m\] \$ '
