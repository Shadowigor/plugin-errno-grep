<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### errno-grep
> A plugin for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

## Install

```fish
$ omf install errno-grep
```


## Usage

Search for error codes, labels or messages

```fish
$ errno-grep 5
5    EIO              I/O error

$ errno-grep EINVAL
22   EINVAL           Invalid argument

$ errno-grep argument
7    E2BIG            Argument list too long
22   EINVAL           Invalid argument
33   EDOM             Math argument out of domain of func
```

Tab-completions for error labels (like EINVAL) are available.

# License

[MIT][mit] © [Shadowigor][author] et [al][contributors]


[mit]:            http://opensource.org/licenses/MIT
[author]:         http://github.com/Shadowigor
[contributors]:   https://github.com/Shadowigor/plugin-errno-grep/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
