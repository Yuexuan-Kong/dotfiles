local fn = vim.fn


-- Install `packer.nvim` plugin manager if not already installed
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Have 'packer.nvim' use a popup window
require('packer').init {
  display = {
    open_fn = function()
      return require("packer.util").float()
    end,
  },
}

require('packer').startup(function()
    
    use { "wbthomason/packer.nvim" }     -- The package manager itself
    use 'nvim-lua/plenary.nvim'          -- Useful lua functions for nvim. Requirement for many plugins

    -- Telescope stuff
    use 'nvim-telescope/telescope.nvim'  -- The one and only

    use {'folke/which-key.nvim', config = function() require('which-key').setup() end}         -- Hints for keymaps

    use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'} -- Colour coding tree sitter

    -- TODO: fix!
    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' }, -- Optional for file icons
      config = function() require'nvim-tree'.setup() end,
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }


    -- CMP: completion engine
    use 'hrsh7th/nvim-cmp'                    -- Completion engine
    use 'hrsh7th/cmp-buffer'                  -- Words in buffer
    use 'hrsh7th/cmp-path'                    -- Filesystem path
    use 'hrsh7th/cmp-nvim-lsp'                -- LSP completion
    use 'hrsh7th/cmp-nvim-lsp-signature-help' -- Show function signature as typing happens
    use 'saadparwaiz1/cmp_luasnip'            -- LSP completion

    -- Snippets!
    use 'L3MON4D3/LuaSnip'                    -- Snippet engine (contains no snippets)
    use 'rafamadriz/friendly-snippets'        -- Collection of snippets

    -- Colorscheme
    use {"navarasu/onedark.nvim", config = function() 
        require('onedark').setup({
          style = "warm",
          toggle_style_key = '<leader><leader><leader>',
        })
        require('onedark').load()
      end
    }

    -- LSP
    use 'folke/lsp-colors.nvim'           -- Adds LSP related highlights groups optional to some plugins
    use {"williamboman/mason.nvim",
      requires = {"williamboman/mason-lspconfig.nvim",  "neovim/nvim-lspconfig"},
      config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
          automatic_installation = true,  -- If an LSP is configured in these dotfiles, it will be installed
        })
      end
    }

    -- Git
    use {'lewis6991/gitsigns.nvim',  -- Git integration
      config = function() require('gitsigns').setup() end
    }

    -- bars
    use 'nvim-lualine/lualine.nvim'
    use 'seblj/nvim-tabline'

    -- If packer has just been installed, download plugins
    if PACKER_BOOTSTRAP then require('packer').sync() end
  end
)

require"plugins.cmp"
require"plugins.lsp"
require"plugins.lualine"
