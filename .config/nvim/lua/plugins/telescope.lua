local telescope_resume = function()
  return require("telescope.builtin").resume()
end

local telescope_find_files = function()
  return require("telescope.builtin").find_files({ hidden = true })
end

local telescope_find_files_relative_to_buffer = function()
  local utils = require("telescope.utils")
  return require("telescope.builtin").find_files({ cwd = utils.buffer_dir(), hidden = true })
end

local telescope_old_files = function()
  return require("telescope.builtin").oldfiles()
end

local telescope_live_grep = function()
  return require("telescope").extensions.live_grep_args.live_grep_args()
end

local telescope_grep_word_under_cursor = function()
  return require("telescope-live-grep-args.shortcuts").grep_word_under_cursor()
end

local telescope_buffers = function()
  return require("telescope.builtin").buffers({ sort_lastused = true, sort_mru = true })
end

local telescope_command_history = function()
  return require("telescope.builtin").command_history()
end

local telescope_search_history = function()
  return require("telescope.builtin").search_history()
end

local telescope_quickfix_list = function()
  return require("telescope.builtin").quickfix()
end

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
    },
    opts = function()
      local live_grep_args_actions = require("telescope-live-grep-args.actions")
      return {
        defaults = {
          path_display = {
            "truncate",
          },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ["<C-k>"] = live_grep_args_actions.quote_prompt(),
                ["<C-i>"] = live_grep_args_actions.quote_prompt({ postfix = " --iglob " }),
              },
            },
          },
        },
      }
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("live_grep_args")
    end,
    keys = {
      { "<leader>fr", telescope_resume,                        desc = "Resume last telescope" },
      { "<leader>ff", telescope_find_files,                    desc = "Find files" },
      { "<leader>fd", telescope_find_files_relative_to_buffer, desc = "Find files relative to buffer" },
      { "<leader>fo", telescope_old_files,                     desc = "Recent files" },
      { "<leader>fg", telescope_live_grep,                     desc = "Live grep" },
      { "<leader>fw", telescope_grep_word_under_cursor,        desc = "Grep word under cursor" },
      { "<leader>fb", telescope_buffers,                       desc = "Buffers" },
      { "<leader>fc", telescope_command_history,               desc = "Command history" },
      { "<leader>fs", telescope_search_history,                desc = "Search history" },
      { "<leader>fq", telescope_quickfix_list,                 desc = "Quickfix list" },
    },
    cmd = "Telescope",
  },
}
