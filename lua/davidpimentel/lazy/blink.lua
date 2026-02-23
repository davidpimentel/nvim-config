return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
    },
    -- <C-y> accepts, <C-n>/<C-p> navigate, <C-space> trigger

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      accept = {
        auto_brackets = { enabled = true }, -- fixes the ? on optional props
      },
      menu = {
        draw = {
          treesitter = { "lsp" }, -- uses treesitter for better highlighting in menu
        },
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
