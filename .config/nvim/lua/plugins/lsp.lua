return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("*", {
        capabilities = {
          textDocument = {
            semanticTokens = {
              multilineTokenSupport = true,
            },
          },
        },
        root_markers = { ".git" },
      })
    end,
  },
}
