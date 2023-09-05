function clean() {
	if [ -f "$1" ] ; then
		cat $1 | /bin/sed 's/^[ \t]*//' | /bin/grep -v -e "^#" -e "^;" -e "^[[:space:]]*$"
	else
		echo "ERROR: Cannot locate file ($1)" >&2
	fi
}

