local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities
local java = require('java')
local lspconfig = require "lspconfig"

java.setup()

lspconfig.docker_compose_language_service.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "yaml.docker-compose", "yml.docker-compose" }
}

lspconfig.dockerls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "dockerfile" }
}

lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "java" }
}

lspconfig.marksman.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "markdown" }
}


lspconfig.pyright.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" }
}

lspconfig.svelte.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "svelte" }
}

lspconfig.volar.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "javascript", "javascriptreact", "javascriptreact.jsx", "typescriptreact", "typescriptreact.tsx", "vue", "json", "css" },
}

