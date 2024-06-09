-- Leader keys
vim.g.mapleader        = ' '
vim.g.maplocalleader   = ' '

-- Providers
vim.g.have_nerd_font   = true
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider  = 0

-- Appearance settings
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.mouse          = 'a'
vim.opt.showmode       = false
vim.opt.clipboard      = 'unnamedplus'
vim.opt.breakindent    = true
vim.opt.signcolumn     = 'yes'
vim.opt.list           = true
vim.opt.listchars      = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand     = 'split'
vim.opt.cursorline     = true
vim.opt.guicursor      = 'n-v-c-sm-r-cr-o-i-ci-ve:hor25'

-- File handling
vim.opt.undofile       = true

-- Search settings
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.hlsearch       = true

-- UI behavior
vim.opt.updatetime     = 250
vim.opt.timeoutlen     = 300
vim.opt.splitright     = true
vim.opt.splitbelow     = true
vim.opt.scrolloff      = 20

-- Indentation settings
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.softtabstop    = 4
vim.opt.expandtab      = true


vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  change_detection = { notify = false },
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
