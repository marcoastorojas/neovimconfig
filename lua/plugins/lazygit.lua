return {
  'kdheepak/lazygit.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config=function ()
    vim.keymap.set('n', '<Leader>gg', ':LazyGit<CR>', { noremap = true, silent = true})
  end

}

