local M = {}

function M.lazy_setup()
  return {
    'shaunsingh/nord.nvim', -- Nord color scheme
    'navarasu/onedark.nvim' -- One Dark themes.
  }
end

function M.set_theme(theme)
  vim.cmd('syntax enable')
  vim.o.background = "dark"
  vim.cmd('colorscheme ' .. theme)
end

function M.set_dark()
  vim.o.background = "dark"
end

function M.set_light()
  vim.o.background = "light"
end

return M
