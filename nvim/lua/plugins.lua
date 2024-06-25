local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Package management
  use 'wbthomason/packer.nvim'

  -- Common utilities (required by telescope)
  use 'nvim-lua/plenary.nvim' -- Common utilities


  --
  -- Completion stuff
  --
	
  -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-buffer'
  -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-nvim-lsp'
  -- Completion
  use 'hrsh7th/nvim-cmp'
  -- Bracket completion
  use 'windwp/nvim-autopairs'
  -- HTML tag completion (for JSX)
  use 'windwp/nvim-ts-autotag'
  -- Snippets
  use 'L3MON4D3/LuaSnip'
  

  --
  -- LSP stuff
  -- 

  -- Quickstarts for nvim's built-in LSP
  use 'neovim/nvim-lspconfig'
  -- LSP UIs
  use 'glepnir/lspsaga.nvim'
  -- Pictograms in LSP menus (similar to VSCode)
  use 'onsails/lspkind-nvim' -- vscode-like pictograms


  --
  -- Highlighting
  --

  -- Treesitter highlights
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- 
  -- File picker stuff
  --

  -- Telescope file picker
  use 'nvim-telescope/telescope.nvim'
  -- Visual file browser pane for Telescope
  use 'nvim-telescope/telescope-file-browser.nvim'
  -- fzf integration for Telescope
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }


  --
  -- Git stuff
  --

  -- Show added/removed/changed highlights in nvim buffers
  use 'lewis6991/gitsigns.nvim'
  -- vim-fugitive clone for nvim
  use 'dinhhuy258/git.nvim'
	
  
  --
  -- UI stuff
  --

  -- Color theme
  use 'Mofiqul/dracula.nvim'
  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  -- Powerline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }
  -- Bufferline (open files picker)
  use 'akinsho/nvim-bufferline.lua'
end)
