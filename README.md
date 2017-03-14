<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### autoproxy
> A plugin for [Oh My Fish][omf-link] to automatically
> set [proxy](https://github.com/oh-my-fish/plugin-proxy) settings.

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.5.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

## Overview

Set proxy settings based on the result from a user-defined command.

## Install

```fish
$ omf install autoproxy
```


## Usage

This plugin uses
the [proxy](https://github.com/oh-my-fish/plugin-proxy) plugin, so you
need to configure it accordingly to its instructions. For example, in
`$OMF_CONFIG/before.init.fish`:

```fish
set proxy_host proxy.corpdomain.com:8079
set proxy_auth false
```

You need to set `autoproxy_check_command` to a command that returns
`true` when the proxy should be set, and `false` when it should be
unset. This command will be executed before every command you type, so
it should run very fast.

For example, in `$OMF_CONFIG/before.init.fish`:

```fish
set autoproxy_check_command "test -f /etc/resolv.conf; and egrep -q '^(search|domain).*corpdomain.com' /etc/resolv.conf"
```

# License

[MIT][mit] © [Diego Zamboni][author] et [al][contributors]


[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/zzamboni
[contributors]:   https://github.com/zzamboni/plugin-autoproxy/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
