# lua-string-replace

[![test](https://github.com/mah0x211/lua-string-replace/actions/workflows/test.yml/badge.svg)](https://github.com/mah0x211/lua-string-replace/actions/workflows/test.yml)
[![codecov](https://codecov.io/gh/mah0x211/lua-string-replace/branch/master/graph/badge.svg)](https://codecov.io/gh/mah0x211/lua-string-replace)


replaces a specified string `target` with another specified string `rep`.

## Installation

```
luarocks install string-replace
```

## Usage

```lua
local replace = require('string.replace')

print(replace('hello world!', 'world', 'foobar'))
-- hello foobar!

print(replace('a|b|c|d|e|', '|'))
-- abcde

print(replace('a|b|c|d|e|', '|', 2))
-- hell
```


## s = replace( s, target [, rep [, count [, init]]] )

replaces a specified string `target` with another specified string `rep`.

**Params**

- `s:string`: a string.
- `target:string`: a target string.
- `rep:string`: a replacement string. (default: `''`)
- `count:number`: number of replacements. `count <= 0` to replace all. (default: `0`)
- `init:number`: specifies where to start the search. (default: `1`)

**Returns**

- `s:string`: result string.
