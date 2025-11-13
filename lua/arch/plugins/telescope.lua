return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "folke/todo-comments.nvim",
  },
  config = function()
    local keymap = vim.keymap
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
        file_ignore_patterns = {
          "node_modules",
        },
      },
    })

    telescope.load_extension("fzf")

    keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Telescope find files" })
    keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope recent files" })
    keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope live grep" })
    keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Telescope live grep current string" })
    keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Telescope todos" })
    keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Telescope keymaps" })
  end,
}
