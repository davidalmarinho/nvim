local M = {}

function M.lazy_setup()
  return {
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
  }
end

function M.setup()
  require('gitsigns').setup()
end

return M
