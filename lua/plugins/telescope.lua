return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8', -- Usa la versión estable más reciente
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Buscar archivos' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Buscar texto en archivos' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Listar buffers abiertos' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Buscar en la ayuda' })
    end
  },
  {
    'aznhe21/actions-preview.nvim',
    config = function()
      require('actions-preview').setup({
        backend = { 'telescope' },
      })
      vim.keymap.set({ 'v', 'n' }, '<leader>ca', require('actions-preview').code_actions)
    end,
  }
}
