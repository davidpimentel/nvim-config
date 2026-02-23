return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvim_tree = require("nvim-tree")
    local nvim_tree_api = require("nvim-tree.api")
    nvim_tree.setup({
      view = {
        width = 35,
      },
      renderer = {
        group_empty = true, -- collapses single-child dirs into one line
      },
      filters = {
        dotfiles = false, -- set true to hide dotfiles
      },
      update_focused_file = {
        enable = true, -- highlights the current file in the tree
      },
    })

    vim.keymap.set("n", "<leader>e", nvim_tree_api.tree.toggle, { desc = "Toggle file tree" })
    vim.keymap.set("n", "<leader>E", nvim_tree_api.tree.focus, { desc = "Focus file tree" })
  end,
}
