return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        mode = { "n", "v" },
        { "<leader>f",  group = "file/find" },
        { "<leader>g",  group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>n",  group = "noice" },
        { "[",          group = "prev" },
        { "]",          group = "next" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
