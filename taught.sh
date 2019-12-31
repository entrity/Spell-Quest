grep --color=always -r --include='*.sh' '^[ 	]*learned' --exclude-dir=home . "${@}" | tr -d '	'
