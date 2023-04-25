rgless() {
    rg -p "$@" | less -RM
}

alias rgl=rgless
