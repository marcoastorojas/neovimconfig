return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    require("dapui").setup({})
    local dap = require("dap")

    vim.fn.sign_define('DapBreakpoint', {
      text = '🔴', -- Ícono de breakpoint
      texthl = 'DapBreakpoint', -- Resaltado (puedes definirlo más abajo)
      linehl = '', -- Resaltado de línea (opcional)
      numhl = '' -- Resaltado de número (opcional)
    })

    vim.fn.sign_define('DapStopped', {
      text = '👉',
      texthl = 'DapStopped',
      linehl = 'DapStopped',
      numhl = ''
    })

    vim.keymap.set('n', '<F4>', dap.toggle_breakpoint, {});
    vim.keymap.set('n', '<F5>', dap.continue, {});
    vim.keymap.set('n', '<F9>', dap.step_over, {});
    vim.keymap.set('n', '<F10>', dap.step_into, {});
    vim.keymap.set('n', '<F6>', dap.terminate, {}) -- Mapeo para detener el debug

    local M = {
      register_dotnet_dap = require("plugins.debugconfig.dotnet")
    }

    M.register_dotnet_dap()
  end
}
