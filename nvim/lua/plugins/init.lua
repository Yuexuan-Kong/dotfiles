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
    use {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'} -- Colour coding tree sitter

    -- TODO: fix!
    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' }, -- Optional for file icons
      config = function() require'nvim-tree'.setup({
        filters = { custom = { "^.git$" } },
        git = { ignore = false }
      }) end,
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }


    -- CMP: completion engine
    use 'hrsh7th/nvim-cmp'                    -- Completion engine
    use 'hrsh7th/cmp-buffer'                  -- Words in buffer
    use 'hrsh7th/cmp-path'                    -- Filesystem path
    use 'hrsh7th/cmp-nvim-lsp'                -- LSP completion
    use 'hrsh7th/cmp-nvim-lsp-signature-help' -- Show function signature as typing happens
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'            -- LSP completion

    -- Snippets!
    use 'L3MON4D3/LuaSnip'                    -- Snippet engine (contains no snippets)
    use 'rafamadriz/friendly-snippets'        -- Collection of snippets

    -- Colorscheme
    use {"navarasu/onedark.nvim", config = function() 
        require('onedark').setup({
          style = "deep",
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
          ensure_installed = {'pyright'}
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

    -- surroundings
    use({"kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
      end
    })

    -- add lines for indent to look prettier
    use ({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        vim.opt.list = true
        -- vim.opt.listchars:append "space:⋅"
        vim.opt.listchars:append "eol:↴"

        require("indent_blankline").setup {
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true,
          }
      end
    })

    -- autopairs
    use {"windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }

    -- comment lines 
    use {'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
    }

    -- show images in nvim
    use {'edluffy/hologram.nvim',
      config = function() require("hologram").setup ({
        auto_display = true,
      })
    end
  }
    -- If packer has just been installed, download plugins
    if PACKER_BOOTSTRAP then require('packer').sync() end
  end
)

require"plugins.cmp"
require"plugins.lsp"
require"plugins.lualine"
