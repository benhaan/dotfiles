alias pg-up="pg_ctl -D $(brew --prefix)/var/postgres -l $(brew --prefix)/var/postgres/server.log start"
alias pg-down="pg_ctl -D $(brew --prefix)/var/postgres stop -s -m fast"
