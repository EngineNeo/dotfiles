export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

PS1="%F{green}%D{%H:%M:%S} %F{green}%~ %F{green}→ %f"
PS2="%n $2~ %#"

autoload -Uz add-zsh-hook
add-zsh-hook chpwd () { 
  if [[ -n "$TMUX" ]]; then
    tmux rename-window "$(basename $PWD)"
  fi
}

