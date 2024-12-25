return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      if (vim.g.colors_name or ""):find("catppuccin") then
        opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
      end
      opts.options = {
        mode = "tabs",
        separator_style = "slant",
        always_show_bufferline = false,
      }
    end,
  },
}
