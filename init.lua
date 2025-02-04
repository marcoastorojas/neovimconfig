local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>wq', ':wq<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<CapsLock>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<CapsLock>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward-to)')
vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward-to)')
vim.keymap.set('n', '<C-f>', '/', { noremap = true, silent = false })
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR><Esc>', { noremap = true, silent = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*", -- Se aplica a todos los archivos; puedes especificar patrones, e.j. "*.lua"
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

require("lazy").setup("plugins", {})
