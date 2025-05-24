-- lua/config/autopreview.lua
local image = require("image")

-- Auto-preview image files
vim.api.nvim_create_autocmd({"BufEnter", "BufReadPost"}, {
  pattern = {"*.png", "*.jpg", "*.jpeg", "*.webp", "*.gif", "*.PNG", "*.JPG"},
  callback = function(args)
    local buf = vim.api.nvim_get_current_buf()
    if not vim.api.nvim_buf_is_valid(buf) then return end
    
    local filepath = vim.fn.expand("%:p")
    if vim.fn.filereadable(filepath) == 1 then
      pcall(function()
        image.show(filepath, {
          buffer = buf,
          with_virtual_padding = true,
          window_overlap = "allow",
          backend = "kitty"
        })
      end)
    end
  end
})
