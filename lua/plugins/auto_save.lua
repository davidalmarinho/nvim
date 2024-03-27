local M = {}

function M.lazy_setup()
  return {
		"Pocco81/auto-save.nvim",
		config = function()
						 require("auto-save").setup {
						 -- your config goes here
						 -- or just leave it empty :)
		}
		end,
  }
end

return M
