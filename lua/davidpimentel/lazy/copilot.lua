return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      enabled = not vim.g.ai_cmp,
      hide_during_completion = vim.g.ai_cmp,
      keymap = {
        accept = "<C-y>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<ESC>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
