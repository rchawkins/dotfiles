-- keymaps.lua
-- Define leader key as space - used for custom shortcuts
vim.g.mapleader = " "

-- Quick escape from insert mode
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true })

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

