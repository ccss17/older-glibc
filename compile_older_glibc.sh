if [ -z $1 ] || [ -z $2 ]; then
    echo "Usage: $0 <gblic_version> <file> <out>"
fi

BASE=/tmp

main() {
    VER=$1
    FILE=$2
    OUT=$3
    CC=gcc
    shift
    shift
    shift
    $CC \
        -L$BASE/$VER/lib \
        -I$BASE/$VER/include \
        -Wl,--rpath=$BASE/$VER/lib \
        -Wl,--dynamic-linker=$BASE/$VER/lib/ld-linux-x86-64.so.2 $FILE -o $OUT \
        $@
}

main $@
