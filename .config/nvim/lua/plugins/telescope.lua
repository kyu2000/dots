return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        cmd = "Telescope",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ["<C-h>"] = "which_key"
                    }
                }
            }
        }
    }
}
