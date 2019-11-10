# devenv_compile_ruby

Docker image and Makefile for building ruby from source and preparing it for
use as an rvm binary on Debian Buster. Intended for use with
`leighmcculloch/devenv`.

## Building

```
make build
```

A `.tar.bz2` file will be outputted in the `ruby` directory.

## Installing resulting binary

```
rvm mount [path to .tar.bz2 file]
rvm mount -r [url to .tar.bz2 file]
```
