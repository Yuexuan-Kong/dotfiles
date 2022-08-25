# How to `nvim`

## Changing config

## Installing plugins

1. Find github link
2. see if it has packer.nvim installation:
   This normally comes as a `use {"user/reponame", config = require("reponame").setup({options})}`
3. Place it inside `packer.startup()` in `lua/plugins/init.lua`
4. Save `lua/plugins/init.lua` and either:
   1. open another `nvim` instance
   2. Run `:source %` on the `lua/plugins/init.lua` file
5. Run `:PackerInstall`


### Something doesnt work as you want it?

If you have just installed a plugin and it does not seem to work, run `:PackerSync`.

Have you actually even read the full README.md?

Try running `:checkhealth` and look for errors. `:checkhealth <plugin>` will only output plugin specific errors (i.e `:checkhealth which_key`)

## Lua basics

```lua

-- Comments go with double dashes
require("something") -- like python: import something

local v = 3 -- variable
local module = require("module") -- imports normally go to a variable

require("module").setup() -- to call setup() on module
```

## Random vim commands

`%` to jump between delimiters (i.e, (), [])
`<c-w>` for managing window stuff.
`<c-w><shift-movement keys>` for changing the split of windows


## Telescope commands

`<c-t>` opening a new tab
`<c-x>` horizontal split
`<c-v>` vertical split
`<cr>` open in current buffer

## Why is LSP this weird to setup :)

There are two level of abstractions:
  - LSP as a protocol (built-in neovim)
  - Specific lsp implementation (needs separate installation per language)
    - Also known as handlers

Neovim's builtin lsp hands out LSP requests to installed and configured LSP handlers.
So we need to (1) Install LSPs (2) call `setup` on all of them (3) Make sure that we
are passing LSP requests to the correct handlers.

### You will need to start getting used to virtualenvs, sorry ^^!

We need `npm`, which is `Node package manager`, `node` is a javascript backend framework.
`node` will be used to communicate with `lsp`s. running `brew install node` is enough to install it!

We are setting lsp through [mason.nvim](https://github.com/williamboman/mason-lspconfig.nvim). We only needed to
(1) call the setup function in `plugins/lsp/init.lua` for each langauge server (2) Because we have the mason-lspconfig setting
`automatic_installation = true`, we don't need anything else. THat's a lie, we might need to install via brew some stuff
(i.e `brew install lua-language-server` for lua lsp).

