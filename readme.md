# older gblic

compile with older glibc 

## Usage

- `./compile_older_glibc.sh <version> <file>.c <out>`

  - compile with glibc-2.23 (&rarr; Ubuntu 16.04)
  
    ```shell
    ./compile_older_glibc.sh 2.23 show_glibc_version.c show_glibc_version
    ```
  
  - compile with glibc-2.27 (&rarr; Ubuntu 18.04)
  
    ```shell
    ./compile_older_glibc.sh 2.27 show_glibc_version.c show_glibc_version
    ```

## Test 

```shell
make
./show_glibc_version_2.23
./show_glibc_version_2.27
./show_glibc_version_current
```

The output may be as follows:

```shell
gnu_get_libc_version() = 2.23
gnu_get_libc_version() = 2.27
gnu_get_libc_version() = 2.30
```