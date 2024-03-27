local M = {}

function M.lazy_setup()
  return {
    'akinsho/bufferline.nvim', version = "*",
	  dependencies = 'nvim-tree/nvim-web-devicons'
  } -- LineBuffer
end

return M
