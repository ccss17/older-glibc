if [ -z $1 ] || [ -z $2 ]; then
    echo "Usage: $0 <gblic_version> <file> <out>"
fi

main() {
    VER=$1
    FILE=$2
    OUT=$3
    CC=gcc
    shift
    shift
    shift
    $CC \
        -L$PWD/$VER/lib \
        -I$PWD/$VER/include \
        -Wl,--rpath=$PWD/$VER/lib \
        -Wl,--dynamic-linker=$PWD/$VER/lib/ld-linux-x86-64.so.2 $FILE -o $OUT
    echo "REMAIN" $@
}

main $@
