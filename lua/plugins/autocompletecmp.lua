return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",     -- Fuente para LSP
    "hrsh7th/cmp-buffer",       -- Fuente para el buffer actual
    "hrsh7th/cmp-path",         -- Fuente para rutas de archivos
    "hrsh7th/cmp-cmdline",      -- Fuente para la línea de comandos
    "L3MON4D3/LuaSnip",         -- Motor de snippets
    "saadparwaiz1/cmp_luasnip", -- Fuente para LuaSnip
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    cmp.register_source('easy-dotnet', require('easy-dotnet').package_completion_source)

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<Esc>'] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.complete()
      }),
      sources = cmp.config.sources(
        {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'easy-dotnet' }
        },
        {
          { name = 'buffer' },
        }
      ),
    })

    -- Configuración para la línea de comandos
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end,
}
