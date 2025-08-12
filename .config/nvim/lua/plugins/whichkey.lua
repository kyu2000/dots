return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        mode = { "n", "v" },
        { "<leader>f",  group = "find" },
        { "<leader>g",  group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>s",  group = "search" },
        { "<leader>n",  group = "noice" },
        { "<leader>q",  group = "quit/session" },
        { "<leader>u",  group = "setting toggles" },
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
