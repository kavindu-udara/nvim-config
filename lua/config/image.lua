require("image").setup({
  backend = "kitty",
  max_width = 80,
  max_height_window = 0.8,
  kitty = {
    enabled = true,
    clear = true,
    replace = true,
    download_remote_images = true
  },
  integrations = {
    markdown = {
      enabled = true,
      sizing_strategy = "auto"
    }
  },
  window_overlap = {
    enabled = true,
    win_hl = "Normal",
    create_autocmds = true
  }
})
