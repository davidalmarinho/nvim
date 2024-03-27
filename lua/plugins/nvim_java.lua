local M = {}

function M.lazy_setup()
  return {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        },
      }
    },
  }
end

function M.setup()
  require('java').setup()
  require('lspconfig').jdtls.setup({
    handlers = {
       ['language/status'] = function(_, result)
          -- Print or whatever.
       end,
       ['$/progress'] = function(_, result, ctx)
          -- disable progress updates.
       end,
    },
  })
end

return M
