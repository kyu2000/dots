return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
    keys = {
      { "<S-Enter>",  function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c",                              desc = "Redirect Cmdline" },
      { "<leader>nl", function() require("noice").cmd("last") end,                   desc = "Noice Last Message" },
      { "<leader>nh", function() require("noice").cmd("history") end,                desc = "Noice History" },
      { "<leader>na", function() require("noice").cmd("all") end,                    desc = "Noice All" },
      { "<leader>nd", function() require("noice").cmd("dismiss") end,                desc = "Dismiss All" },
      { "<leader>nt", function() require("noice").cmd("pick") end,                   desc = "Noice Picker (Telescope/FzfLua)" },
    }
  },
}
