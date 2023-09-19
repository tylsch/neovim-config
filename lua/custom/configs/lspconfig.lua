local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities
local lspconfig = require "lspconfig"

lspconfig.pyright.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" }
}

lspconfig.volar.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
}
