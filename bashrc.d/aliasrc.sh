
################ DEVELOPMENT ALIASES
# powershell
alias powershell='pwsh'


setmyaliases() 
{
    # Program full paths
    local CURL="$(type -p curl)"
    local GCC_CONFIG="$(type -p gcc-config)"
    local NSLOOKUP="$(type -p nslookup)"
    local PORT="$(type -p port)"      # MacPorts
    local SED="$(type -p sed)"
    local SSH="$(type -p ssh)"
    local SUDO="$(type -p sudo)"
    local TAIL="$(type -p tail)"
    local WHICH="$(type -p which)"

    ### Aliases
    alias hist="history"
    # not sure this works
    # alias lastcmd="history |${TAIL} -1 |${SED} -e's/ *[0-9]* *//' "
    alias ll='ls ${LS_OPTIONS} -al'
    alias ls='ls ${LS_OPTIONS}'
    alias path='echo "${PATH}"'
    [[ -e "${CURL}" ]] && alias randpass="${CURL} -k https://intranet.erad.com/pwdgen.cgi"
    [[ -e "${GCC_CONFIG}" ]] && alias harden="${GCC_CONFIG} 2; source /etc/profile;"
    [[ -e "${GCC_CONFIG}" ]] && alias unharden="${GCC_CONFIG} 5; source /etc/profile;"
    [[ -e "${PORT}" ]] && alias port="${PORT} -v"       # MacPorts
    # [[ -e "${SSH}" ]] && alias ssh="${SSH} -Y"
    # The only reason (so far) for this sudo alias is because systemd
    # needs to have $SYSTEMD_LESS passed in, in order to use it.
    [[ -e "${SUDO}" ]] && alias sudo="${SUDO} -E"

    #history
    alias histOn='set -o history'
    alias histOff='set +o history'

    unset -f setmyaliases
		
		#df changed due to new default df behavior including memory filesystems.
		alias df='df -x tmpfs -x squashfs -x devtmpfs'

		alias wget-='wget -q -O -'
}

setmyaliases
