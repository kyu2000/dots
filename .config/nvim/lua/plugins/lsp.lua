return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    dependencies = {
      "mason.nvim",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "taplo",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-lspconfig.nvim",
    },
    event = "VeryLazy",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
      })
      require("lspconfig").taplo.setup({
        capabilities = capabilities,
      })
    end,
  },
}

-- keybindings:
-- use on lsp attach to map keys after language server attaches to the current buffer
-- gd -> telescope builtin lsp definitions
-- gD -> vim lsp buf declarations
-- gr -> telescope builtin lsp references
-- gi -> telescope builtin lsp implementations
-- K -> vim lsp buf hover
