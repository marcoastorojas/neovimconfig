return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          highlight = "NeoTreeFileIcon", --Habilita resaltado de iconos
        },
        follow_current_file = {
          enabled = true
        },
        use_libuv_file_watcher = true
      },
      -- Opcional: Personaliza iconos
      icon = {
        folder_closed = "",
        folder_open = "",
        default = "",
      },
    })
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
  end
}
