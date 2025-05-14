# Function to show Git branch and status
git_prompt_info() {
  local branch
  if command -v git &>/dev/null && git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --exact-match 2>/dev/null)
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
      echo "%{$fg[red]%}[$branch ✗]%{$reset_color%}"
    else
      echo "%{$fg[green]%}[$branch ✓]%{$reset_color%}"
    fi
  fi
}

# Only show host if not localhost
host_prompt() {
  [[ "$HOST" != "localhost" ]] && echo "%{$fg[cyan]%}%n@%m:%{$reset_color%} "
}

# Main prompt
PROMPT='$(host_prompt)%{$fg[blue]%}%~%{$reset_color%} $(git_prompt_info)
❯ '

# Optional: right-side prompt (time)
RPROMPT='%{$fg[magenta]%}%*%{$reset_color%}'

