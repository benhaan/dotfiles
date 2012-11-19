autoload colors && colors


CURRENT_BG='NONE'
SEGMENT_SEPARATOR='⮀'

prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]
  then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

prompt_end() {
  if [[ -n $CURRENT_BG ]]
  then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

git_dirty() {
  st=$(/usr/local/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    # This isn't a git repo, so do nothing :-)
  else
    if [[ $st == "nothing to commit, working directory clean" ]]
    then
      prompt_segment green black "$(git_prompt_info)"
    else
      prompt_segment yellow black "$(git_prompt_info) ±"
    fi
  fi
}

git_prompt_info () {
  ref=$(/usr/local/bin/git symbolic-ref HEAD 2>/dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
  echo -n "${ref/refs\/heads\//⭠ }"
}

unpushed () {
  /usr/local/bin/git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    # We're good
  else
    prompt_segment magenta black "unpushed"
    #echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

rb_prompt(){
  if $(which rbenv &> /dev/null)
  then
    prompt_segment red black "$(rbenv version | awk '{print $1}')"
  fi
}

directory_name(){
  prompt_segment blue black '%~'
  #echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

prompt_status () {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}


build_prompt() {
  RETVAL=$?
  prompt_status
  rb_prompt
  directory_name
  git_dirty
  need_push
  prompt_end
}


git_branch() {
  echo $(/usr/local/bin/git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

todos() {
  num=$(osascript ~/todo-count.scpt)
  echo "$num todo's"
}

#export PROMPT=$'\nin $(directory_name) $(git_dirty)$(need_push)\n› '
export PROMPT=$'\n%{%f%b%k%}$(build_prompt)\n> '


set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}$(todos)%{$reset_color%}"
}

precmd() {
  title "zsh" "%n" "%55<...<%~"
  set_prompt
}
