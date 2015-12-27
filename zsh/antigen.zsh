# Antigen
[[ ! -d $ZSH/antigen ]] &&
  git clone https://github.com/zsh-users/antigen.git $ZSH/antigen

source $ZSH/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git
antigen bundle github
antigen bundle go
antigen bundle heroku
antigen bundle pip
antigen bundle bundler
antigen bundle capistrano
antigen bundle command-not-found
antigen bundle gem
antigen bundle rails
antigen bundle rake
antigen bundle rbenv
antigen bundle vagrant

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

if [ "$(uname)" = "Darwin" ]; then
antigen bundle brew
antigen bundle brew-cask
fi

antigen apply