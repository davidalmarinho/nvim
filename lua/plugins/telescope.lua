local M = {}

function M.lazy_setup()
  return {
		-- Telescope
		-- init.lua:
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }
  }
end

return M
