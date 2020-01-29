CC = gcc
LIB = $(PWD)/2.23/lib
INC = $(PWD)/2.23/include
all: show_glibc_version_current show_glibc_version_old

show_glibc_version_current: show_glibc_version.c
	$(CC) $< -o $@

show_glibc_version_old: show_glibc_version.c
	$(CC) -L$(LIB) -I$(INC) -Wl,--rpath=$(LIB) -Wl,--dynamic-linker=$(LIB)/ld-linux-x86-64.so.2 $< -o $@

clean:
	rm show_glibc_version_current show_glibc_version_old
