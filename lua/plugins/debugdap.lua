return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dapui = require("dapui")
    dapui.setup({})

    vim.keymap.set('n', '<leader>dt', require('dap').toggle_breakpoint, {});
    vim.keymap.set('n', '<leader>dc', require('dap').continue, {});

    local M = {}
    M.register_net_dap = require("plugins.helpers.dap_net")

    M.register_net_dap()
  end
}
