return {
  "folke/noice.nvim",
  config = function()
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      messages = {
        enabled = true,
      },
      cmdline = {
        enabled = true,
        view = "cmdline",
        position = {
          row = 1,
          col = "50%",
        },
      },
      views = {
        mini = {
          position = {
            row = 1,
            col = "50%",
          },
          win_options = {
            winblend = 0,     --
          },
          border = "rounded", -- Borde redondeado para agrupar los mensajes
        },
      },
      presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = false,
        inc_rename = false,
        lsp_doc_border = false,
      },
    })

    vim.o.cmdheight = 0
  end
}
