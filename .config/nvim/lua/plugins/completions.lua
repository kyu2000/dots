return {
  {
    "saghen/blink.cmp",
    version = "v0.*",
    lazy = true,
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        appearance = {
          nerd_font_variant = "mono"
        }
      },
      completion = {
        trigger = {
          show_in_snippet = false,
        },
        list = {
          selection = "manual",
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
    opts_extend = { "sources.default" },
  },
}
