return {
  "folke/tokyonight.nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {
    on_highlights = function(highlights, colors)
      -- Change the foreground color of all line numbers
      highlights.LineNr = { fg = '#FFFFFF', bold = true }
      highlights.LineNrAbove = { fg = '#FFFFFF', bold = true }
      highlights.LineNrBelow = { fg = '#FFFFFF', bold = true }
      highlights.CopilotSuggestion = { fg = colors.blue }
    end
  }
}
