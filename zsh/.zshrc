# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dchw/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias please='sudo $(fc -ln -1)'
