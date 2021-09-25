starship init fish | source

# anyenv (.fishファイルを開いた時なぜかエラーが出る)
#set -x PATH $HOME/.anyenv/bin $PATH
#eval (anyenv init - | source)

# done
set -U __done_min_cmd_duration 5000  # default: 5000 ms
set -U __done_notify_sound 1
#set -U __done_exclude 'git (?!push|pull)'  # default: all git commands, except push and pull. accepts a regex.


# hub
#eval (hub alias -s)
