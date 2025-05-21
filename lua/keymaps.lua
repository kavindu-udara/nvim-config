vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("v", "<leader>y", '"+y')  -- Copy to system clipboard
vim.keymap.set("n", "<leader>p", '"+p')  -- Paste from system clipboard
vim.keymap.set('n', '<leader>t', ':split | terminal<CR>', { noremap = true, silent = true })

-- keymaps.lua

-- Copy to system clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>yy", '"+yy', { noremap = true, silent = true })

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>P", '"+P', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>p", '"+p', { noremap = true, silent = true })

