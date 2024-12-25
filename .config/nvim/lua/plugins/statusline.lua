return {
  {
    "freddiehaddad/feline.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local ctp_feline = require("catppuccin.groups.integrations.feline")
      ctp_feline.setup()
      opts.components = ctp_feline.get()
    end,
  },
}
