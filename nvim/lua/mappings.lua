local opts = {
  noremap = true,  -- Don't allow for recursive mappings
  silent = false   -- Execute command silently (show command at the bottom)
}

-- Sets the almight <leader> to space!
vim.g.mapleader = ' '

local keymap = vim.api.nvim_set_keymap


------- Which-key territory

local wk = require("which-key")

-- Neovim
wk.register({
  ['<leader>'] = {
    v = {
      name = 'Neovim',
      ["H"] = {":tabprevious<cr>", "Previous tab"},
      ["L"] = {":tabnext<cr>", "Next tab"},
      ["l"] = {"<C-w>l", "window on the right"},
      ["h"] = {"<C-w>h", "window on the left"},
      ["<C-Up>"] = {":resize -5<cr>", "Resize vertical line to the left"},
      ["<C-Down>"] = {":resize +5<cr>", "Resize vertical line to the right"},
      ["<C-Left>"] = {":vertical resize -5<cr>", "Resize horizontal line to up"},
      ["<C-Right>"] = {":vertical resize +5<cr>", "Resize vertical line to the down"}
    }
  }
})

-- Telescope
wk.register({
  ['<leader>'] = {
    t = {
      name = 'Telescope',
      ["f"] = {"<cmd>Telescope find_files<cr>", "Find files in current working directory"},
      ["h"] = {"<cmd>Telescope help_tags<cr>", "Search through help"},
      ["k"] = {"<cmd>Telescope keymaps<cr>", "Show keymaps"},
      ["g"] = {"<cmd>Telescope grep_string<cr>", "Fuzzy search across all files"},
      ["d"] = {"<cmd>lua require'telescope.builtin'.find_files({cwd='~/dotfiles/nvim/'})<cr>", "Open NVIM config"},
    }
  }
})


-- NvimTree
wk.register({
  ['<leader>'] = {
    n = {
      name = 'NvimTree',
      n = {"<cmd>NvimTreeToggle<cr>", "Toggle Tree"},
      e = {"<cmd>NvimTreeFindFileToggle<cr>", "Toggle tree on current file"},
      f = {"<cmd>NvimTreeFocus<cr>", "Focus on tree"},
    }
  }
})


-- LSP
local vertical_layout = "{layout_strategy='vertical', layout_config = {mirror = true}}"
wk.register({
  K = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Show documentation"},
  W = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Show signature help"}, -- Not working
  ['<leader>'] = {
    l = {
      name = 'LSP',
      d = {string.format("<cmd>lua vim.lsp.buf.definition(%s)<CR>", vertical_layout), "Go to definition"},
      D = {string.format("<cmd>lua vim.lsp.buf.declaration(%s)<CR>", vertical_layout), "Go to declaration"},
      i = {string.format("<cmd>lua vim.lsp.buf.implementation(%s)<CR>", vertical_layout), "Go to implementation"},
      -- TODO: implementation is not working
      r = {string.format("<cmd>lua require('telescope.builtin').lsp_references(%s)<cr>", vertical_layout), "Show references"},
    },
  }
  -- TODO: get some extra stuff from handlers.lua
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
})
