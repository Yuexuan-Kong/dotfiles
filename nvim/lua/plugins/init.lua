local fn = vim.fn
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
    use 'nvim-telescope/telescope.nvim'  -- The one and only

    use {'folke/which-key.nvim', config = function() require('which-key').setup() end}         -- Hints for keymaps

    use {'nvim-treesitter/nvim-treesitter'} -- Colour coding tree sitter

    -- Colorscheme
    use 'Mofiqul/dracula.nvim'
    use 'folke/tokyonight.nvim'

    use 'nvim-lua/plenary.nvim'          -- Useful lua functions for nvim. Requirement for many plugins
   
    if PACKER_BOOTSTRAP then require('packer').sync() end
  end
)
