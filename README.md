# 8cc-elc-hs
[![wercker status](https://app.wercker.com/status/58d52d173d227199e549fdf158f44561/s/develop "wercker status")](https://app.wercker.com/project/byKey/58d52d173d227199e549fdf158f44561)

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


## References

* [yutopp/8cc.rill](https://github.com/yutopp/8cc.rill)
* [rhysd/8cc.vim: C Compiler written in Vim script](https://github.com/rhysd/8cc.vim)