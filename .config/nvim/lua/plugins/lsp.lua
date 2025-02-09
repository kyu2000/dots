local function lsp_on_attach(client, bufnr)
  vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true, buffer = bufnr })
  end
  map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", "LSP definition")
  map("n", "gD", "<cmd>Telescope lsp_type_definitions<cr>", "LSP type definition")
  map("n", "gr", "<cmd>Telescope lsp_references<cr>", "LSP references")
  map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", "LSP implementations")
  map("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "LSP signature help")
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP hover")
  map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", "LSP previous diagnostic")
  map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", "LSP next diagnostic")
end

local function default_handler(server_name)
  require("lspconfig")[server_name].setup({
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    on_attach = lsp_on_attach,
  })
end

return {
  {
    "williamboman/mason.nvim",
    lazy = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    opts = {
      ensure_installed = {
        "lua_ls",
      },
      handlers = {
        default_handler,
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
      require("mason").setup()
      require("mason-lspconfig").setup()
    end,
  },
}
