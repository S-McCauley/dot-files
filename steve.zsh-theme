# username prompt
username() {
    echo "%{$fg[blue]%}¯\_(ツ)_/¯%{$reset_color%}"
#   echo "%{$fg[white]%}¯%{$fg[cyan]%}\\_(%{$fg[green]%}ツ%{$fg[blue]%})_/¯%{$reset_color%}"

}

# current directory, two levels deep
directory() {
   echo "%{$fg[cyan]%}%2~"
}

# current time with milliseconds
current_time() {
   echo "%*"
}

# returns 👾 if there are errors, nothing otherwise
return_status() {
   echo "%(?..👾)"
}

# sets the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue](%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# putting it all together
PROMPT='%B$(username) $(directory)$(git_prompt_info)%b '
RPROMPT='$(current_time)$(return_status)'
