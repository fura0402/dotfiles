# prompt
prompt_check
trap prompt_check SIGWINCH

# alias
all_alias

# z command
source /usr/local/etc/profile.d/z.sh
unalias z

# hub
#eval "$(hub alias -s)"

# done (original)
#/usr/bin/osascript -e 'display notification "hogehoge" with title "iTerm" subtitle "done." sound name "Submarine"'
