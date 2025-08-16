return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    cmd = {
      "TSUpdateSync",
      "TSUpdate",
      "TSInstall",
    },
    keys = {
      { "<C-space>", desc = "Increment Selection" },
      { "<BS>",      desc = "Decrement Selection", mode = "x" },
    },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "diff",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<BS>",
        },
      },
    },
    main = "nvim-treesitter.configs",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    keys = {
      {
        "[c",
        function()
          require("treesitter-context").go_to_context(vim.v.count1)
        end,
        desc = "Previous context",
        mode = { "n" },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<C-space>", desc = "Increment Selection", mode = { "x", "n" } },
        { "<BS>",      desc = "Decrement Selection", mode = "x" },
      },
    },
  },
}
