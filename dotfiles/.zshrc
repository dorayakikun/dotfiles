alias ls="exa"
alias ll="exa -lh"
alias rm="rm -i"
alias vim="nvim"

# cargo
export PATH=$PATH:$HOME/.cargo/bin

# cat
alias cat='bat'

# diff-highlight
export PATH=$PATH:/usr/local/opt/git/share/git-core/contrib/diff-highlight

# Docker
export DOCKER_BUILDKIT=1

# du
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# fzf
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

# git
alias gbr="git branch | grep -v "master" | grep -v "develop" | xargs git branch -D"

# go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# help
alias help='tldr'

# homebrew
export PATH=/usr/local/bin:$PATH

# hub
eval "$(hub alias -s)"

# ping
alias ping='prettyping --nolegend'

# preview
alias preview="fzf --preview 'bat --color \"always\" {}'"

# top
alias top="htop"

# yarn
export PATH=$(yarn global bin):$PATH

#zplug
source ~/.zplug/init.zsh

zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

zplug check || zplug install

fpath+=~/.zfunc
fpath+="$(rustc --print sysroot)/share/zsh/site-functions"
autoload -U compinit
compinit

zplug load

function powerline_precmd() {
    PS1="$($GOPATH/bin/powerline-go -error $? -shell zsh -newline)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
