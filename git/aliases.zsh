# Use hub as git wrapper if it's installed
hubified=$(which hub)
if [[ -f $hubified ]]
then
  alias git=$hubified
fi

alias g='/usr/local/bin/git' # For the rare times I need plain git.. Thanks gerrit :-/
alias gst='git status -sb'
alias gb='git branch'
alias grm='git status | grep deleted | awk "{print \$3}" | xargs git rm'
alias gc='git commit'
alias gco='git checkout'
alias gca='git commit -a'
alias gau='git add -u'
alias gd='git diff'
alias gdt='git difftool'
