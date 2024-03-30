local M = {}

function M.set_keybinds()
  local open_term_action = '<ESC>:split<CR>' ..
                           '<ESC>:wincmd j<CR>' ..
                           '<ESC>:term<CR>' ..
                           '<ESC>:res -13<CR>' ..
                           '<ESC>:startinsert<CR>'

  vim.keymap.set( 'n', '<C-F12>', open_term_action, { noremap = true, silent = false })
  vim.keymap.set( 'i', '<C-F12>', open_term_action, { noremap = true, silent = false })
  vim.keymap.set( 'n', '<F36>', open_term_action, { noremap = true, silent = false })
  vim.keymap.set( 'i', '<F36>', open_term_action, { noremap = true, silent = false })

  vim.keymap.set( 'n', '<Leader>p', '<ESC>:Telescope find_files<CR>', { noremap = true, silent = false })

  vim.keymap.set( 't', '<Esc>', '<C-\\><C-n>' )
end

function M.set_config()
  vim.opt.colorcolumn = '80,100'
  -- The line beneath this is called `modeline`. See `:help modeline`
  -- vim: ts=2 sts=2 sw=2 et
  vim.o.tabstop     = 2 --tabsize
  vim.o.shiftwidth  = 2 --size of indentation
  -- vim.bo.softtabstop = 4
  -- vim.bo.autoindent = true
  vim.o.smartindent = true
  vim.o.expandtab   = true --use spaces insetad tabs

  -- Set completeopt to have a better completion experience
  vim.o.completeopt = 'menuone,noselect'

  -- Make line numbers default
  vim.wo.number = true
  vim.wo.relativenumber = true

  -- Save undo history
  vim.o.undofile = true

  -- Sync clipboard between OS and Neovim.
  vim.o.clipboard = 'unnamedplus'

  -- Check spelllang
  vim.o.spelllang = "en_us"

  -- Auto tab size according specific language.
  vim.cmd [[
    augroup BufferSettings
      autocmd!
        autocmd BufEnter *.py setlocal tabstop=4 shiftwidth=4
        autocmd BufEnter *.java setlocal tabstop=4 shiftwidth=4
        autocmd BufEnter *.c setlocal tabstop=4 shiftwidth=4
        autocmd BufEnter *.cpp setlocal tabstop=4 shiftwidth=4
        autocmd BufEnter *.rs setlocal tabstop=4 shiftwidth=4
        autocmd BufEnter *.js setlocal tabstop=2 shiftwidth=2
        autocmd BufEnter *.tex setlocal tabstop=2 shiftwidth=2
        autocmd BufEnter *.lua setlocal tabstop=2 shiftwidth=2
    augroup END
  ]]
end

return M
