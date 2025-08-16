return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = {
        enabled = true,
        indent = {
          char = "▏",
        },
        scope = {
          enabled = false,
        },
      },
      picker = {
        enabled = true,
        formatters = {
          file = {
            truncate = 100,
          },
        },
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["Y"] = "copy_path",
                },
              },
            },
            actions = {
              copy_path = function(_, item)
                local modify = vim.fn.fnamemodify
                local filepath = item.file
                local filename = modify(filepath, ":t")
                local values = {
                  modify(filepath, ":."),
                  filepath,
                  filename,
                  modify(filename, ":r"),
                  modify(filename, ":e"),
                }
                local items = {
                  "Path relative to CWD: " .. values[1],
                  "Absolute path: " .. values[2],
                  "Filename: " .. values[3],
                }
                if vim.fn.isdirectory(filepath) == 0 then
                  vim.list_extend(items, {
                    "Filename without extension: " .. values[4],
                    "Extension of the filename: " .. values[5],
                  })
                end
                vim.ui.select(items, { prompt = "Choose to copy to clipboard:" }, function(choice, i)
                  if not choice then
                    vim.notify("Selection cancelled")
                    return
                  end
                  if not i then
                    vim.notify("Invalid selection")
                    return
                  end
                  local result = values[i]
                  vim.fn.setreg('"', result) -- Neovim unnamed register
                  vim.fn.setreg("+", result) -- System clipboard
                  vim.notify("Copied: " .. result)
                end)
              end,
            },
          },
        },
      },
      words = { enabled = true },
    },
    keys = {
      {
        "<leader><leader>",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart Find Files",
      },
      {
        "<leader>/",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>:",
        function()
          Snacks.picker.command_history()
        end,
        desc = "Command History",
      },
      {
        "<leader>e",
        function()
          Snacks.explorer()
        end,
        desc = "File Explorer",
      },
      -- find
      {
        "<leader>ff",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>fd",
        function()
          Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") })
        end,
        desc = "Find Files",
      },
      {
        "<leader>fc",
        function()
          Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Config File",
      },
      {
        "<leader>fg",
        function()
          Snacks.picker.git_files()
        end,
        desc = "Find Git Files",
      },
      -- git
      {
        "<leader>gb",
        function()
          Snacks.picker.git_branches()
        end,
        desc = "Git Branches",
      },
      {
        "<leader>gl",
        function()
          Snacks.picker.git_log()
        end,
        desc = "Git Log",
      },
      {
        "<leader>gL",
        function()
          Snacks.picker.git_log_line()
        end,
        desc = "Git Log Line",
      },
      {
        "<leader>gs",
        function()
          Snacks.picker.git_status()
        end,
        desc = "Git Status",
      },
      {
        "<leader>gS",
        function()
          Snacks.picker.git_stash()
        end,
        desc = "Git Stash",
      },
      {
        "<leader>gd",
        function()
          Snacks.picker.git_diff()
        end,
        desc = "Git Diff (Hunks)",
      },
      {
        "<leader>gf",
        function()
          Snacks.picker.git_log_file()
        end,
        desc = "Git Log File",
      },
      -- Grep
      {
        "<leader>sb",
        function()
          Snacks.picker.lines()
        end,
        desc = "Buffer Lines",
      },
      {
        "<leader>sB",
        function()
          Snacks.picker.grep_buffers()
        end,
        desc = "Grep Open Buffers",
      },
      {
        "<leader>sg",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>sw",
        function()
          Snacks.picker.grep_word()
        end,
        desc = "Visual selection or word",
        mode = { "n", "x" },
      },
      -- search
      {
        '<leader>s"',
        function()
          Snacks.picker.registers()
        end,
        desc = "Registers",
      },
      {
        "<leader>s/",
        function()
          Snacks.picker.search_history()
        end,
        desc = "Search History",
      },
      {
        "<leader>sa",
        function()
          Snacks.picker.autocmds()
        end,
        desc = "Autocmds",
      },
      {
        "<leader>sC",
        function()
          Snacks.picker.commands()
        end,
        desc = "Commands",
      },
      {
        "<leader>sd",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        "<leader>sD",
        function()
          Snacks.picker.diagnostics_buffer()
        end,
        desc = "Buffer Diagnostics",
      },
      {
        "<leader>sh",
        function()
          Snacks.picker.help()
        end,
        desc = "Help Pages",
      },
      {
        "<leader>sH",
        function()
          Snacks.picker.highlights()
        end,
        desc = "Highlights",
      },
      {
        "<leader>si",
        function()
          Snacks.picker.icons()
        end,
        desc = "Icons",
      },
      {
        "<leader>sj",
        function()
          Snacks.picker.jumps()
        end,
        desc = "Jumps",
      },
      {
        "<leader>sk",
        function()
          Snacks.picker.keymaps()
        end,
        desc = "Keymaps",
      },
      {
        "<leader>sl",
        function()
          Snacks.picker.loclist()
        end,
        desc = "Location List",
      },
      {
        "<leader>sm",
        function()
          Snacks.picker.marks()
        end,
        desc = "Marks",
      },
      {
        "<leader>sM",
        function()
          Snacks.picker.man()
        end,
        desc = "Man Pages",
      },
      {
        "<leader>sp",
        function()
          Snacks.picker.lazy()
        end,
        desc = "Search for Plugin Spec",
      },
      {
        "<leader>sq",
        function()
          Snacks.picker.qflist()
        end,
        desc = "Quickfix List",
      },
      {
        "<leader>sR",
        function()
          Snacks.picker.resume()
        end,
        desc = "Resume",
      },
      {
        "<leader>su",
        function()
          Snacks.picker.undo()
        end,
        desc = "Undo History",
      },
      {
        "<leader>uC",
        function()
          Snacks.picker.colorschemes()
        end,
        desc = "Colorschemes",
      },
      -- LSP
      {
        "gd",
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = "Goto Definition",
      },
      {
        "gD",
        function()
          Snacks.picker.lsp_declarations()
        end,
        desc = "Goto Declaration",
      },

      {
        "grr",
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = "References",
      },
      {
        "gri",
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = "Goto Implementation",
      },
      {
        "grt",
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = "Goto T[y]pe Definition",
      },
      {
        "<leader>ss",
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = "LSP Symbols",
      },
      {
        "<leader>sS",
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = "LSP Workspace Symbols",
      },
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
          Snacks.toggle.inlay_hints():map("<leader>uh")
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
          Snacks.toggle
            .new({
              id = "treesitter_context",
              name = "Treesitter context",
              get = function()
                return require("treesitter-context").enabled()
              end,
              set = function(state)
                if state then
                  require("treesitter-context").enable()
                else
                  require("treesitter-context").disable()
                end
              end,
            })
            :map("<leader>uc")
        end,
      })
    end,
  },
}
