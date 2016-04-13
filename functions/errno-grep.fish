# SYNOPSIS
#   errno-grep search term
#
# USAGE
#     Search for error numbers, abbreviations or messages
#

function errno-grep -d "Searches for error codes"
    if [ (expr substr "$argv" 1 1) = "-" ]
        set search_term $argv[2..-1]
        set flag (expr substr $argv[1] 2 1)
    else
        set search_term $argv
    end

    set -l oldIFS "$IFS"
    set IFS ""
    set -l errno_input (echo -e "1    EPERM            Operation not permitted\n2    ENOENT           No such file or directory\n3    ESRCH            No such process\n4    EINTR            Interrupted system call\n5    EIO              I/O error\n6    ENXIO            No such device or address\n7    E2BIG            Argument list too long\n8    ENOEXEC          Exec format error\n9    EBADF            Bad file number\n10   ECHILD           No child processes\n11   EAGAIN           Try again\n11   EWOULDBLOCK      Operation would block\n12   ENOMEM           Out of memory\n13   EACCES           Permission denied\n14   EFAULT           Bad address\n15   ENOTBLK          Block device required\n16   EBUSY            Device or resource busy\n17   EEXIST           File exists\n18   EXDEV            Cross-device link\n19   ENODEV           No such device\n20   ENOTDIR          Not a directory\n21   EISDIR           Is a directory\n22   EINVAL           Invalid argument\n23   ENFILE           File table overflow\n24   EMFILE           Too many open files\n25   ENOTTY           Not a typewriter\n26   ETXTBSY          Text file busy\n27   EFBIG            File too large\n28   ENOSPC           No space left on device\n29   ESPIPE           Illegal seek\n30   EROFS            Read-only file system\n31   EMLINK           Too many links\n32   EPIPE            Broken pipe\n33   EDOM             Math argument out of domain of func\n34   ERANGE           Math result not representable\n35   EDEADLK          Resource deadlock would occur (EDEADLOCK)\n36   ENAMETOOLONG     File name too long\n37   ENOLCK           No record locks available\n38   ENOSYS           Function not implemented\n39   ENOTEMPTY        Directory not empty\n40   ELOOP            Too many symbolic links encountered\n42   ENOMSG           No message of desired type\n43   EIDRM            Identifier removed\n44   ECHRNG           Channel number out of range\n45   EL2NSYNC         Level 2 not synchronized\n46   EL3HLT           Level 3 halted\n47   EL3RST           Level 3 reset\n48   ELNRNG           Link number out of range\n49   EUNATCH          Protocol driver not attached\n50   ENOCSI           No CSI structure available\n51   EL2HLT           Level 2 halted\n52   EBADE            Invalid exchange\n53   EBADR            Invalid request descriptor\n54   EXFULL           Exchange full\n55   ENOANO           No anode\n56   EBADRQC          Invalid request code\n57   EBADSLT          Invalid slot\n59   EBFONT           Bad font file format\n60   ENOSTR           Device not a stream\n61   ENODATA          No data available\n62   ETIME            Timer expired\n63   ENOSR            Out of streams resources\n64   ENONET           Machine is not on the network\n65   ENOPKG           Package not installed\n66   EREMOTE          Object is remote\n67   ENOLINK          Link has been severed\n68   EADV             Advertise error\n69   ESRMNT           Srmount error\n70   ECOMM            Communication error on send\n71   EPROTO           Protocol error\n72   EMULTIHOP        Multihop attempted\n73   EDOTDOT          RFS specific error\n74   EBADMSG          Not a data message\n75   EOVERFLOW        Value too large for defined data type\n76   ENOTUNIQ         Name not unique on network\n77   EBADFD           File descriptor in bad state\n78   EREMCHG          Remote address changed\n79   ELIBACC          Can not access a needed shared library\n80   ELIBBAD          Accessing a corrupted shared library\n81   ELIBSCN          .lib section in a.out corrupted\n82   ELIBMAX          Attempting to link in too many shared libraries\n83   ELIBEXEC         Cannot exec a shared library directly\n84   EILSEQ           Illegal byte sequence\n85   ERESTART         Interrupted system call should be restarted\n86   ESTRPIPE         Streams pipe error\n87   EUSERS           Too many users\n88   ENOTSOCK         Socket operation on non-socket\n89   EDESTADDRREQ     Destination address required\n90   EMSGSIZE         Message too long\n91   EPROTOTYPE       Protocol wrong type for socket\n92   ENOPROTOOPT      Protocol not available\n93   EPROTONOSUPPORT  Protocol not supported\n94   ESOCKTNOSUPPORT  Socket type not supported\n95   EOPNOTSUPP       Operation not supported on transport endpoint\n96   EPFNOSUPPORT     Protocol family not supported\n97   EAFNOSUPPORT     Address family not supported by protocol\n98   EADDRINUSE       Address already in use\n99   EADDRNOTAVAIL    Cannot assign requested address\n100  ENETDOWN         Network is down\n101  ENETUNREACH      Network is unreachable\n102  ENETRESET        Network dropped connection because of reset\n103  ECONNABORTED     Software caused connection abort\n104  ECONNRESET       Connection reset by peer\n105  ENOBUFS          No buffer space available\n106  EISCONN          Transport endpoint is already connected\n107  ENOTCONN         Transport endpoint is not connected\n108  ESHUTDOWN        Cannot send after transport endpoint shutdown\n109  ETOOMANYREFS     Too many references: cannot splice\n110  ETIMEDOUT        Connection timed out\n111  ECONNREFUSED     Connection refused\n112  EHOSTDOWN        Host is down\n113  EHOSTUNREACH     No route to host\n114  EALREADY         Operation already in progress\n115  EINPROGRESS      Operation now in progress\n116  ESTALE           Stale NFS file handle\n117  EUCLEAN          Structure needs cleaning\n118  ENOTNAM          Not a XENIX named type file\n119  ENAVAIL          No XENIX semaphores available\n120  EISNAM           Is a named type file\n121  EREMOTEIO        Remote I/O error\n122  EDQUOT           Quota exceeded\n123  ENOMEDIUM        No medium found\n124  EMEDIUMTYPE      Wrong medium type\n125  ECANCELED        Operation Canceled\n126  ENOKEY           Required key not available\n127  EKEYEXPIRED      Key has expired\n128  EKEYREVOKED      Key has been revoked\n129  EKEYREJECTED     Key was rejected by service\n130  EOWNERDEAD       Owner died\n131  ENOTRECOVERABLE  State not recoverable")

    if not [ "$search_term" ]
        echo $errno_input
    else
        if [ "$search_term" -eq "$search_term" ]
            set search_term "^$search_term "
        else if not [ "$flag" = "" ]
            set search_term "  $search_term"
        end
        set errno_output (echo "$errno_input" | grep -i "$search_term")
    end

    if [ "$flag" = "m" ]
        echo "$errno_output" | head -n 1 | awk '{$1="";$2="";print substr($0,3)}'
    else if [ "$flag" = "n" ]
        echo "$errno_output" | head -n 1 | awk '{print $1}'
    else if [ "$flag" = "l" ]
        echo "$errno_output" | head -n 1 | awk '{print $2}'
    else
        echo "$errno_output"
    end

    set IFS "$oldIFS"
end
