local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c_sharp",
        "css",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "graphql",
        "html",
        "java",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "python",
        "rust",
        "scala",
        "scss",
        "smithy",
        "sql",
        "typescript",
        "xml",
        "yaml"
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "vue-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "lua-language-server",
        "pyright"
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      extensions = function ()
        return require("metals").commands()
      end
    },
  },
  {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- stylua: ignore
    keys = require("custom.configs.nvim_metals").keys,
    init = function()
      local metals_config = require("custom.configs.nvim_metals").config()

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      })
    end,
  },
}
return plugins
