# devenv_compile_ruby

[![Build](https://github.com/leighmcculloch/devenv_compile_ruby/workflows/build/badge.svg)](https://github.com/leighmcculloch/devenv_compile_ruby/actions)
[![Release](https://img.shields.io/github/v/release/leighmcculloch/devenv_compile_ruby.svg)](https://github.com/leighmcculloch/devenv_compile_ruby/releases/latest)

Docker image and Makefile for building ruby from source and preparing it for
use as an rvm binary on Debian Buster. Intended for use with
`leighmcculloch/devenv`.

## Building

```
make ruby
```

A `.tar.bz2` file will be outputted in the `ruby` directory.

## Installing resulting binary

```
rvm mount [path to .tar.bz2 file]
rvm mount -r [url to .tar.bz2 file]
```

## Limitations

Only works with users named `leighmcculloch` because the location of libruby
somehow is encoded into the resulting binary package. Let me know if you know
how I can get around that!
