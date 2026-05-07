# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias explorer="xdg-open"
alias neofetch="fastfetch"

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# nvim aliases
alias vi='nvim'
alias vim='nvim'

# easier parent cd
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'

# swap two files
function swap()         
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# jump command
j() {
    case "${1,,}" in   # converts $1 to lowercase
        documents) cd ~/Documents ;;
	music) cd ~/Music ;;
	desktop) cd ~/Desktop ;;
	docs) cd ~/Documents ;;
	doc) cd ~/Documents ;;

    downloads) cd ~/Downloads ;;
	dl) cd ~/Downloads ;;

	code) cd ~/Documents/Code ;;
	nvim) cd ~/.config/nvim ;;
    cad) cd ~/Documents/CAD ;;

        *) echo "Unknown location: $1" ;;
    esac
}

_j_completion() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local options="documents music desktop docs doc downloads dl code nvim cad"

    local lc_cur="${cur,,}"
    local matches=()
    for opt in $options; do
        if [[ "${opt,,}" == "$lc_cur"* ]]; then
            matches+=("$opt")
        fi
    done

    COMPREPLY=("${matches[@]}")
}

complete -F _j_completion j
