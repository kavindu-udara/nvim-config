require("lualine").setup({
  options = { theme = "catppuccin" },
  sections = { lualine_a = { "mode" }, lualine_b = { "filename", "diagnostics" } },
})

