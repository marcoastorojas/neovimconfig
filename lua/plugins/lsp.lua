return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = { 'williamboman/mason.nvim', "neovim/nvim-lspconfig", },
  config = function()
    require('mason').setup()
    local masonlspconfig = require('mason-lspconfig')
    local lspconfig = require('lspconfig')
    masonlspconfig.setup({
      ensure_installed = { "lua_ls", "omnisharp" },
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    masonlspconfig.setup_handlers({
      function(server_name)
        if server_name == "lua_ls" then
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        elseif server_name == "ts_ls" then
          lspconfig.ts_ls.setup({
            capabilities = capabilities,
          })
        elseif server_name == "omnisharp" then
          lspconfig.omnisharp.setup({
            capabilities = capabilities,
            cmd = { "dotnet", "/home/marco/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
            settings = {
              FormattingOptions = {
                EnableEditorConfigSupport = true,
                OrganizeImports = nil,
              },
              MsBuild = {
                LoadProjectsOnDemand = nil,
              },
              RoslynExtensionsOptions = {
                EnableAnalyzersSupport = nil,
                EnableImportCompletion = true,
                AnalyzeOpenDocumentsOnly = nil,
              },
              Sdk = {
                IncludePrereleases = true,
              },
            },
          })
        else
          require("lspconfig")[server_name].setup({})
        end
      end,
    })

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', '<Leader>h', '<C-o>', {})
    vim.keymap.set('n', '<Leader>l', '<C-i>', {})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
  end
}
