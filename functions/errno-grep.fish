# SYNOPSIS
#   errno-grep [-n|-l|-m] search term
#
# USAGE
#   Search for error numbers, abbreviations or messages
#
#   -n Only print error number
#   -l Only print error label
#   -m Only print error message
#

function errno-grep -a flag -d "Searches for error codes"
    # Disable splitting of the errno input
    set -lx IFS ""

    # Get arguments
    switch "$flag"
        case '-n'
            set filter '{print $1}'
        case '-l'
            set filter '{print $2}'
        case '-m'
            set filter '{$1="";$2="";print substr($0,3)}'
    end

    if [ "$filter" ]
        set search_term $argv[2..-1]
    else
        set search_term $argv[1..-1]
    end

    # Without a search term, all possibilities are shown
    if not [ "$search_term" ]
        echo $__errno_grep_errno_input
        return 0
    end

    # If the search term is a number, the whole number has to match, because
    # otherwise, searching for 5 would also match 15, 25, 35, etc.
    if [ "$search_term" -eq "$search_term" ]
        set search_term "^$search_term "
    end

    # Make grep-highlighting possible if no flag is specified
    if not [ "$filter" ]
        echo "$__errno_grep_errno_input" | grep -i "$search_term"
        return 0
    end

    # Only output first result (for scripting)
    echo "$__errno_grep_errno_input" | grep -i "$search_term" | head -n 1 | awk "$filter"
end
