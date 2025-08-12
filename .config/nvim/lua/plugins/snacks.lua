return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = { enabled = true },
      indent = {
        enabled = true,
        indent = {
          char = "▏",
        },
        scope = {
          enabled = false,
        },
      },
      words = { enabled = true },
    },
    keys = {
      {
        "]]",
        function()
          Snacks.words.jump(vim.v.count1)
        end,
        desc = "Next Reference",
        mode = { "n", "t" },
      },
      {
        "[[",
        function()
          Snacks.words.jump(-vim.v.count1)
        end,
        desc = "Prev Reference",
        mode = { "n", "t" },
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>uD")
          Snacks.toggle
            .new({
              id = "diagnostics_virtual_text",
              name = "Diagnostics virtual text",
              get = function()
                return not not vim.diagnostic.config().virtual_text
              end,
              set = function(state)
                vim.diagnostic.config({ virtual_text = state })
              end,
            })
            :map("<leader>ud")
        end,
      })
    end,
  },
}
