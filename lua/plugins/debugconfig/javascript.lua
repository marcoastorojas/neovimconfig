return function()
  local function get_pkg_path(pkg, path)
    pcall(require, 'mason')
    local root = vim.env.MASON or (vim.fn.stdpath('data') .. '/mason')
    path = path or ''
    local ret = root .. '/packages/' .. pkg .. '/' .. path
    return ret
  end

  local dap = require("dap")

  dap.adapters['pwa-node'] = {
    type = 'server',
    host = 'localhost',
    port = '${port}',
    executable = {
      command = 'node',
      args = {
        get_pkg_path('js-debug-adapter', '/js-debug/src/dapDebugServer.js'),
        '${port}',
      },
    },
  }
  for _, ext in ipairs({ "javascript", "typescript" }) do
    dap.configurations[ext] = {
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch Current File (pwa-node)',
        cwd = vim.fn.getcwd(),
        args = { '${file}' },
        sourceMaps = true,
        protocol = 'inspector',
      },
    }
  end
end
