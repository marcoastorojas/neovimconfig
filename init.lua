local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>wq', ':wq<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<CapsLock>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<CapsLock>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward-to)')
vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward-to)')
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*", -- Se aplica a todos los archivos; puedes especificar patrones, e.j. "*.lua"
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})


require("lazy").setup("plugins", {})
