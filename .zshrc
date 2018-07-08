export PATH="/Users/ray/anaconda3/bin:$PATH"

# Fix Python locale issues
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Aliases
alias ll='ls -la'
alias ...='cd ../../'
alias ....='cd ../../../'
alias mkdir='mkdir -pv'
eval $(thefuck --alias)

source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle git
antigen bundle osx
antigen bundle extract
antigen bundle z
antigen bundle command-not-found

antigen bundle supercrabtree/k
antigen bundle andrewferrier/fzf-z
antigen bundle hlissner/zsh-autopair

AUTO_LS_COMMANDS=(ls)
antigen bundle desyncr/auto-ls

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

alias k='k -h'
