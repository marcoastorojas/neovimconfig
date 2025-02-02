return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('bufferline').setup()
    -- Definir la función globalmente en _G
    _G.close_buffer = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local buftype = vim.api.nvim_buf_get_option(bufnr, 'buftype')

      -- Si es NeoTree, solo lo cierra sin eliminarlo
      if buftype == "nofile" then
        vim.cmd("Neotree close")
        return
      end

      -- Obtener la lista de buffers abiertos
      local buffers = vim.fn.getbufinfo({ buflisted = 1 })

      if #buffers == 1 then
        -- Si es el último buffer abierto, salir de Neovim en lugar de dejar "[No Name]"
        vim.cmd("qall")
        return
      end

      -- Moverse al siguiente buffer antes de cerrar el actual
      vim.cmd("bnext")
      vim.cmd("bdelete " .. bufnr)
    end
    -- Atajos para cambiar de buffer
    vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

    -- Atajo para cerrar buffers sin dejar NeoTree en pantalla completa
    vim.api.nvim_set_keymap('n', '<C-w>', ':lua _G.close_buffer()<CR>', { noremap = true, silent = true })
  end
}
