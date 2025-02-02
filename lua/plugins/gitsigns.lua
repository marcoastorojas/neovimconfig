return {
  'lewis6991/gitsigns.nvim',
  version = "*",
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('gitsigns').setup({
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
      },
      numhl = true,               -- Resalta el número de línea cuando hay cambios
      signcolumn = true,          -- Muestra signos en la columna izquierda
      word_diff = false,          -- Muestra cambios a nivel de palabra si está activado
      watch_gitdir = { interval = 1000, follow_files = true },
      attach_to_untracked = true, -- Adjunta cambios a archivos nuevos no versionados
      current_line_blame = false, -- Muestra el "blame" de Git en la línea actual
      current_line_blame_opts = { delay = 500, virt_text_pos = 'eol' },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 200,
      max_file_length = 40000, -- No activa en archivos muy grandes
      preview_config = {
        border = 'rounded',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
    })

    -- 🔥 Atajos de teclado para usar Gitsigns 🔥
    local opts = { noremap = true, silent = true }

    -- Navegar entre cambios
    vim.keymap.set('n', ']c', function() require('gitsigns').next_hunk() end, opts)
    vim.keymap.set('n', '[c', function() require('gitsigns').prev_hunk() end, opts)

    -- Ver diferencias en el código
    vim.keymap.set('n', '<Leader>gs', function() require('gitsigns').preview_hunk() end, opts)

    -- Añadir cambios al index (Git add)
    vim.keymap.set('n', '<Leader>ga', function() require('gitsigns').stage_hunk() end, opts)

    -- Eliminar cambios del index (Git reset)
    vim.keymap.set('n', '<Leader>gr', function() require('gitsigns').reset_hunk() end, opts)

    -- Deshacer todos los cambios en el archivo
    vim.keymap.set('n', '<Leader>gR', function() require('gitsigns').reset_buffer() end, opts)

    -- Ver blame en la línea actual (toggle)
    vim.keymap.set('n', '<Leader>gb', function() require('gitsigns').toggle_current_line_blame() end, opts)

    -- Ver diferencias en el archivo entero
    vim.keymap.set('n', '<Leader>gd', function() require('gitsigns').diffthis() end, opts)

    -- Ver diferencias entre HEAD y el index
    vim.keymap.set('n', '<Leader>gD', function() require('gitsigns').diffthis('~1') end, opts)

    -- Desactivar/activar Gitsigns
    vim.keymap.set('n', '<Leader>gx', function() require('gitsigns').toggle_signs() end, opts)
  end
}
