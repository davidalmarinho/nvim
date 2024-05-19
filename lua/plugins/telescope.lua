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

function M.setup()
  require('telescope').setup({
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    defaults = {
      file_ignore_patterns = {
              "node_modules/.*",
              "%.env",
              "yarn.lock",
              "package-lock.json",
              "lazy-lock.json",
              "init.sql",
              "target/.*",
              ".git/.*",
              "out/.*",
      },
    },
    extensions = {
        file_browser = {
            path = "%:p:h",
        },
    },
  })
end

return M
