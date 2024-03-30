-- --------------------------------------------------------------
-- | README:
-- | Search for:
-- | Installed Plugins: <- Here you find the installed plugins.
-- | Current Theme: <- Here can be found the current theme for neovim.
-- | Neovim config: <- Here can be found some configs for neovim, like the indent spaces.
-- | Custom keybinds: <- Here u can the custom keybinds.
-- |
-- | ---
-- | NOTE: If you are using neovim, you probably want to install
-- |       xclip so you can copy text from neovim to others applications.
-- |       yay xclip.
-- --------------------------------------------------------------

local themes           = require('plugins.themes')
local markdown_preview = require('plugins.markdown_preview')
local lsp              = require('plugins.lsp')
local telescope        = require('plugins.telescope')
local nvim_surround    = require('plugins.nvim_surround')
local auto_save        = require('plugins.auto_save')
local nvim_cmp         = require('plugins.nvim_cmp')
local which_key        = require('plugins.which_key')
local vimtex           = require('plugins.vimtex')
local bufferline       = require('plugins.bufferline')
local nvim_java        = require('plugins.nvim_java')
local custom_settings  = require('custom_settings.my_settings')

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true

-- Install package manager
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Installed Plugins:
require("lazy").setup({
  nvim_java.lazy_setup(),
  themes.lazy_setup(),
	'jiangmiao/auto-pairs', -- Auto pairs
  vimtex.lazy_setup(),
  bufferline.lazy_setup(),
	-- Indent Blankline
	{ 
		"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} 
	},

  auto_save.lazy_setup(),
  nvim_surround.lazy_setup(),
  markdown_preview.lazy_setup(),
  lsp.lazy_setup(),
  which_key.lazy_setup(),
  nvim_cmp.lazy_setup(),
  telescope.lazy_setup(),
})

nvim_java.setup()

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = lsp.configure()

-- document existing key chains
which_key.register()

require('mason').setup()
require('mason-lspconfig').setup()
require("bufferline").setup{}

local servers = {
  clangd = {},
  -- gopls = {},
  pyright = {},
  rust_analyzer = {}, -- In order to work, is needed to run: 'rustup component add rust-analyzer'
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

nvim_cmp.configure()

-- Current Theme:
themes.set_theme('onedark')
themes.set_dark()

-- Custom keybinds:
custom_settings.set_keybinds()

-- Neovim config:
custom_settings.set_config()
