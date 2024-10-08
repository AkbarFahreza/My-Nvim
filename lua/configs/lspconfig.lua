-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- example
local servers = { "html", "cssls", "tailwindcss", "eslint", "dartls", "svelte" }
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

require("flutter-tools").setup {
  lsp = {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
}
lspconfig.dartls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  -- Flutter SDK path can be configured if needed
  settings = {
    dart = {
      sdkPath = "/opt/flutter/bin/cache/dart-sdk", -- set this path accordingly
    },
  },
}
lspconfig.tsserver.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact", "mdx" },
}
-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "mdx" },
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
