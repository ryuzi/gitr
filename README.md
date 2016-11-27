gitr - Manage git repository clones
===================================

`gitr` provides a way to organize remote repository clones, like go get does.
Based on [motemen/ghq](https://github.com/motemen/ghq).


Demo
----

![Demo](https://raw.githubusercontent.com/ryuzi/gitr/master/demo.gif)


Getting Started
---------------

### Prerequisites

- Install [bash-completion](https://bash-completion.alioth.debian.org/)
- Install [git](https://git-scm.com/)

### Installation

1. Copy [gitr](https://raw.githubusercontent.com/ryuzi/gitr/master/gitr) file
into `bash_completion.d` directory (under `/sw/etc` or `$(brew --prefix)/etc` on macOS w/ Homebrew).

2. Add the following to your `~/.bash_profile` or `~/.profile`
 ```sh
 export GITR_ROOT=(~/.gitr)
 gitr(){ cd "$(__gitr_dir "$1")" 2> /dev/null || __gitr_clone "$1"; }
 ```

3. Restart your shell


Configuration
-------------

### GITR_ROOT

The path to directory under which cloned repositories are placed.
See [Directory Structures](#directory-structures) below.
Defaults to `~/.gitr`.

This variable can have multiple values.
If so, the first one becomes primary one i.e. new repository clones are always created under it.


Directory Structures
--------------------

Local repositories are placed under `GITR_ROOT` with named github.com/user/repo.

```
~/.gitr
├── bitbucket.org
│   └── openscg
│       └── pgstudio
└── github.com
    ├── motemen
    │   └── ghq
    ├── phalcon
    │   └── zephir
    └── ryuzi
        └── oyster
```


Thanks
------

Inspired by `ghq` in [motemen](https://github.com/motemen).


License
-------

`gitr` is released under an MIT-style license; see LICENSE for details.
