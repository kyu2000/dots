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
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          require("snacks").toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          require("snacks").toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          require("snacks").toggle.line_number():map("<leader>ul")
          require("snacks").toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        end,
      })
    end,
  },
}
