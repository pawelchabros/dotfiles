export PATH="$HOME/.local/bin/:/usr/local/bin/:/usr/lib/:$PATH"

fpath=($ZDOTDIR/external $fpath)

source "$XDG_CONFIG_HOME/zsh/aliases"

zmodload zsh/complist

bindkey 'jk' vi-cmd-mode
bindkey 'kj' vi-cmd-mode

bindkey -M menuselect j vi-backward-char
bindkey -M menuselect k vi-down-line-or-history
bindkey -M menuselect l vi-up-line-or-history
bindkey -M menuselect \; vi-forward-char

bindkey -a j vi-backward-char
bindkey -a k vi-down-line-or-history
bindkey -a l vi-up-line-or-history
bindkey -a \; vi-forward-char

autoload -Uz compinit; compinit
_comp_options+=(globdots) # With hidden files

source ~/dotfiles/zsh/external/completion.zsh

# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using
setopt PUSHD_SILENT

bindkey -v
export KEYTIMEOUT=1

autoload -Uz cursor_mode && cursor_mode

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source ~/dotfiles/zsh/external/bd.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/shell/completion.zsh
    source /usr/share/fzf/shell/key-bindings.zsh
fi

source $DOTFILES/zsh/scripts.sh

ftmuxp

# Clearing the shell is now done with CTRL+p
bindkey -r '^l'
bindkey -r '^p'
bindkey -s '^p' 'clear\n'

# Syntax highlighing
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/share/zsh-syntax-highlighting/highlighters

# Powerlevel
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

