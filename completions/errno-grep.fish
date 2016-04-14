
complete -c errno-grep --no-files -s n -d "Only output the error number"
complete -c errno-grep --no-files -s l -d "Only output the error label"
complete -c errno-grep --no-files -s m -d "Only output the error message"

# Split errno input at newlines
set -lx IFS \n
set -l errno_input (echo $__errno_grep_errno_input)

for arg in $errno_input
    set -l label (echo $arg | awk '{printf $2}')
    set -l message (echo $arg | awk '{$1="";$2="";printf substr($0,3)}')
    complete -c errno-grep --no-files -a "$label" -d "$message"
end
