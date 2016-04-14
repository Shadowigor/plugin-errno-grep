
function init -a path --on-event init_errno-grep
    set -lx IFS ""
    set -g __errno_grep_errno_input (cat "$path/errno.txt")
end
