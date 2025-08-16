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

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if client:supports_method("textDocument/switchSourceHeader") then
            vim.keymap.set("n", "gs", "<cmd>LspClangdSwitchSourceHeader<CR>", {
              desc = "LSP switch source header",
              silent = true,
              buffer = args.buf,
            })
          end
        end,
      })
    end,
  },
}
