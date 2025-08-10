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

          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true, buffer = args.buf })
          end

          if client:supports_method("textDocument/definition") then
            map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", "LSP definition")
          end
          if client:supports_method("textDocument/typeDefinition") then
            map("n", "gD", "<cmd>Telescope lsp_type_definitions<cr>", "LSP type definition")
          end
          if client:supports_method("textDocument/implementation") then
            map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", "LSP implementations")
          end
          if client:supports_method("textDocument/references") then
            map("n", "gr", "<cmd>Telescope lsp_references<cr>", "LSP references")
          end
          if client:supports_method("textDocument/signatureHelp") then
            map("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "LSP signature help")
          end
          if client:supports_method("textDocument/hover") then
            map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP hover")
          end
          if client:supports_method("textDocument/switchSourceHeader") then
            map("n", "gs", "<cmd>LspClangdSwitchSourceHeader<CR>", "LSP switch source header")
          end
        end,
      })
    end,
  },
}
