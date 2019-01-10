# cargo
set -x PATH $HOME/.cargo/bin $PATH

# cat
alias cat='bat'

# diff-highlight
set -x PATH $PATH /usr/local/opt/git/share/git-core/contrib/diff-highlight

# du
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# fzf
set -xg FZF_DEFAULT_OPTS "--bind='ctrl-o:execute(code {})+abort'"

# go
set -xg GOPATH $HOME
set -x PATH $GOPATH/bin $PATH

# help
alias help='tldr'

# ping
alias ping='prettyping --nolegend'

# preview
alias preview="fzf --preview 'bat --color \"always\" {}'"

# top
alias top="htop"

# yarn
set -x PATH "`yarn global bin`" $PATH

# alias
alias ll="exa -lh"
alias rm="rm -i"
