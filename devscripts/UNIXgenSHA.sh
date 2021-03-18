#https://www.computerhope.com/unix/sha512sum.htm
echo "assume officialUNIXsha512 filename is not used,in this folder"
export originpath="$PWD"
find . -type f "-print0"  | xargs "-0" sha512sum>"$originpath/officialUNIXsha512"
