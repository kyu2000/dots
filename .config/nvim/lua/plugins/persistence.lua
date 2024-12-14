return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").load()
        end,
        desc = "Load session for current directory",
      },
      {
        "<leader>qS",
        function()
          require("persistence").select()
        end,
        desc = "Select sessions",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "Load last session",
      },
    },
  },
}
