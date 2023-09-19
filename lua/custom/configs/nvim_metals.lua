local M = {}
local utils = require "core.utils"

M.config = function()
  local metals_config = require("metals").bare_config()
  metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
  metals_config.settings = {
    superMethodLensesEnabled = true,
    showImplicitArguments = true,
    showInferredType = true,
    showImplicitConversionsAndClasses = true,
    excludedPackages = {},
  }
  metals_config.init_options.statusBarProvider = "on"
  return metals_config
end

M.on_attach = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end

  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.keys = {
  {
    "gD",
    function ()
      vim.lsp.buf.declaration()
    end,
    "n",
    desc = "LSP declaration"
  },
  {
    "gd",
    function ()
      vim.lsp.buf.definition()
    end,
    "n",
    desc = "LSP definition"
  },
  {
    "K",
    function ()
      vim.lsp.buf.hover()
    end,
    "n",
    desc = "LSP hover"
  },
  {
    "gi",
    function ()
      vim.lsp.buf.implementation()
    end,
    "n",
    desc = "LSP implementation"
  },
  {
    "<leader>fm",
    function ()
      vim.lsp.buf.format { async = true }
    end,
    "n",
    desc = "LSP formatting"
  },
  {
    "<leader>ls",
    function ()
      vim.lsp.buf.signature_help()
    end,
    "n",
    desc = "LSP signature_help"
  },
  {
    "<leader>D",
    function ()
      vim.lsp.buf.type_definition()
    end,
    "n",
    desc = "LSP definition type"
  },
  {
    "<leader>ra",
    function()
      require("nvchad.renamer").open()
    end,
    "n",
    desc = "LSP rename",
  },
  {
    "<leader>ca",
    function()
      vim.lsp.buf.code_action()
    end,
    "n",
    desc = "LSP code action",
  },
  {
    "gr",
    function()
      vim.lsp.buf.references()
    end,
    "n",
    desc = "LSP references",
  },
  {
    "<leader>f",
    function()
      vim.diagnostic.open_float { border = "rounded" }
    end,
    "n",
    desc = "Floating diagnostic",
  },
  {
    "[d",
    function()
      vim.diagnostic.goto_prev { float = { border = "rounded" } }
    end,
    "n",
    desc = "Goto prev",
  },
  {
    "]d",
    function()
      vim.diagnostic.goto_next { float = { border = "rounded" } }
    end,
    "n",
    desc = "Goto next",
  },
  {
    "<leader>q",
    function()
      vim.diagnostic.setloclist()
    end,
    "n",
    desc = "Diagnostic setloclist",
  },
  {
    "<leader>wa",
    function()
      vim.lsp.buf.add_workspace_folder()
    end,
    "n",
    desc = "Add workspace folder",
  },
  {
    "<leader>wr",
    function()
      vim.lsp.buf.remove_workspace_folder()
    end,
    "n",
    desc = "Remove workspace folder",
  },
  {
    "<leader>wl",
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    "n",
    desc = "List workspace folders",
  },
  {
    "<leader>ma",
    function ()
      require("metals").worksheet_hover()
    end,
    "n",
    desc = "Metals Worksheet Hover"
  },
  {
    "<leader>ca",
    function ()
      vim.lsp.buf.code_action()
    end,
    "v",
    desc = "LSP code action"
  },
}


return M
