# Customize the prompt#
#
#

parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\* /s///p' | sed 's/)//' | sed 's/(//'
}


export PS1="\[\e[0;32m\]\u@\h:\[\e[0;34m\]\w\[\e[0;31m\]\$(parse_git_branch)\[\e[0m\]\$ "


NOTPS1='\[\033[1;32m\]\u@\h \[\033[1;34m\]\w\[\033[1;33m\]$( [ -d .git ] || git rev-parse --git-dir >/dev/null 2>&1 && echo " [$(parse_git_branch)]")\[\033[0m\] \$ '
PS1='\[\033[1;32m\][\u]\[\033[0m\]: \[\033[1;34m\]${PWD##*/}\[\033[1;33m\]$( [ -d .git ] || git rev-parse --git-dir >/dev/null 2>&1 && echo " [$(parse_git_branch)]")\[\033[0m\] \$ '
