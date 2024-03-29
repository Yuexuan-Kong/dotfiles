local o = vim.opt
o.scrolloff = 5              -- Minimal number of screen lines to keep around cursor
o.sidescrolloff = 5          -- Minimal number of columns to scroll horizontally
o.clipboard = 'unnamedplus'  -- Yank operations use + as a register
o.number = true              -- Makes line numbers visible
o.wildmenu = true            -- Matches in command-line completion appear in a menu
o.wildmode = 'full'          -- Bash style recommendations (?)
o.foldmethod = 'marker'      -- Strings '{{{' '}}}' will be used to mark folds
o.inccommand = 'split'       -- Show effects of substitution as it is being typed
o.incsearch = true           -- Go directly to matches during search
o.hlsearch = true            -- Highlight search results
o.ignorecase = true          -- Make searches case insensitive
o.smartcase = true           -- Make searches case sensitive if upper cases are used
o.expandtab = true           -- Turn <tab> into spaces in insert mode
o.tabstop = 2                -- Number of spaces per <tab>
o.shiftwidth = 2             -- Number of spaces to shift for commands like '>>'
o.wrap = false               -- Whether to wrap text by default (Plz don't)
o.conceallevel = 2           -- Allows text to be "concealed"
o.splitbelow = false         -- Horizontal splits always split above
o.splitright = true          -- Vertical splits always split to the right
o.termguicolors = false      -- For proper color rendering
o.relativenumber = true      -- Set line number to relative number
