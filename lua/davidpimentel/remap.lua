local which_key = require "which-key"
local telescope_builtin = require('telescope.builtin')

local telescope_mappings = {
  { "<leader>f",  group = "Find" },
  { "<leader>ff", telescope_builtin.find_files,  desc = "Find files" },
  { "<leader>fg", telescope_builtin.git_files,   desc = "Find git files" },
  { "<leader>fl", telescope_builtin.live_grep,   desc = "Live grep" },
  { "<C-p>",      telescope_builtin.commands,    desc = "Search commands" },
  { "<leader>fb", telescope_builtin.buffers,     desc = "Search buffers" },
  { "<leader>fd", telescope_builtin.diagnostics, desc = "Search diagnostics" },
}

which_key.add(telescope_mappings)

-- remove highlight when you hit esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
