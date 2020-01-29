CC = gcc
VER_2.23 = 2.23
VER_2.27 = 2.27
all: show_glibc_version_current show_glibc_version_$(VER_2.23) show_glibc_version_$(VER_2.27)

show_glibc_version_current: show_glibc_version.c
	$(CC) $< -o $@

show_glibc_version_$(VER_2.23): show_glibc_version.c
	$(CC) \
		-L$(PWD)/$(VER_2.23)/lib \
	   	-I$(PWD)/$(VER_2.23)/include \
		-Wl,--rpath=$(PWD)/$(VER_2.23)/lib \
		-Wl,--dynamic-linker=$(PWD)/$(VER_2.23)/lib/ld-linux-x86-64.so.2 $< -o $@

show_glibc_version_$(VER_2.27): show_glibc_version.c
	$(CC) \
		-L$(PWD)/$(VER_2.27)/lib \
		-I$(PWD)/$(VER_2.27)/include \
		-Wl,--rpath=$(PWD)/$(VER_2.27)/lib \
		-Wl,--dynamic-linker=$(PWD)/$(VER_2.27)/lib/ld-linux-x86-64.so.2 $< -o $@

clean:
	rm show_glibc_version_current show_glibc_version_$(VER_2.23) show_glibc_version_$(VER_2.27)
