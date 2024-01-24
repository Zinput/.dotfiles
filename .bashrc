#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias g++db='g++ -ggdb -pedantic-errors -std=c++20 -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -Wshadow -o'
alias g++rl='g++ -O2 -DNDEBUG -pedantic-errors -std=c++20 -o'
# alias grimshot='/usr/share/sway/scripts/grimshot'
PS1='[\u@\h \W]\$ '

export PATH=/home/jason/.local/bin:$PATH
export PATH=/home/jason/.cargo/bin:$PATH
export PATH=/home/jason/.config/emacs/bin:$PATH
export HSA_OVERRIDE_GFX_VERSION=10.3.0

# exec fish
