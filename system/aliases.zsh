# grc overides for ls
# Made possible through contributions from generous benefactors like
# `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la="gls -A --color"
fi

# flush mac dns cache
dscacheutil_path=$(which dscacheutil)
if [[ -f $dscacheutil_path ]]
then
  alias flushdns='dscacheutil -flushcache'
fi
