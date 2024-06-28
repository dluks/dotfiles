return {
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({
        render = "background", -- or 'foreground', 'first_column', etc.
        enable_named_colors = true,
        enable_tailwind = true,
      })
    end,
  },
}
