# 8cc-hs
[![wercker status](https://app.wercker.com/status/9a093244d45b5bc23b6a4cd80e5b121f/s/develop "wercker status")](https://app.wercker.com/project/byKey/9a093244d45b5bc23b6a4cd80e5b121f)

C Compiler written in Haskell powered by [8cc](https://github.com/rui314/8cc) and [ELVM](https://github.com/shinh/elvm).



## Build

```bash
stack build --fast
```

NOTE: It takes very very long time to compile.

## Install

```bash
stack install
```

Then, `8cc-hs` and `elc-hs` commands will be available.


## Compiler Usage

This section explains how to compile C program.

Input : `example_c/hello.c`  
Output: `hello` executable

```bash
(echo hs && cat example_c/hello.c | 8cc-hs) | elc-hs > hello.hs
stack ghc hello.hs
./hello
```

Important thing is that `8cc-hs` and `elc-hs` are written in pure Haskell.
