## History
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=20000

## Completion
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

## Directory Stack
DIRSTACKSIZE=20
setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME PUSHD_IGNORE_DUPS PUSHD_MINUS

## PATH
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

. "$HOME/.local/bin/env"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

## Alias
alias rm='rm -i'
alias vi='nvim'
alias glo='git log --oneline --decorate'
alias gam='git add -A && git commit -m'
alias dba='docker buildx build --platform linux/amd64'

## Local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

## Prompt
eval "$(starship init zsh)"
