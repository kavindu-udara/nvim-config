vim.g.mapleader = " "  -- Sets the leader key to Space

vim.cmd("let g:netrw_banner = 0")
vim.cmd("let g:netrw_banner = 0")
vim.cmd("call plug#begin('~/.local/share/nvim/plugged')")

vim.cmd("Plug 'catppuccin/nvim', { 'as': 'catppuccin' }")
vim.cmd("Plug 'williamboman/mason.nvim'")
vim.cmd("Plug 'williamboman/mason-lspconfig.nvim'")
vim.cmd("Plug 'nvim-tree/nvim-tree.lua'")
vim.cmd("Plug 'nvim-lua/plenary.nvim'")
vim.cmd("Plug 'nvim-telescope/telescope.nvim'")
vim.cmd("Plug 'nvim-lualine/lualine.nvim'")
vim.cmd("Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}")
vim.cmd("Plug 'neovim/nvim-lspconfig'")
vim.cmd("Plug 'hrsh7th/nvim-cmp'")
vim.cmd("Plug 'hrsh7th/cmp-nvim-lsp'")
vim.cmd("Plug 'hrsh7th/cmp-buffer'")
vim.cmd("Plug 'hrsh7th/cmp-path'")
vim.cmd("Plug 'hrsh7th/cmp-cmdline'")
vim.cmd("Plug 'L3MON4D3/LuaSnip'")
vim.cmd("Plug 'lewis6991/gitsigns.nvim'")
vim.cmd("Plug 'saadparwaiz1/cmp_luasnip'")
vim.cmd("Plug 'numToStr/Comment.nvim'")
-- Terminal
vim.cmd("Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}")
-- alpha vim
vim.cmd("Plug 'goolord/alpha-nvim'")
vim.cmd("Plug 'nvim-tree/nvim-web-devicons'")

-- Image
vim.cmd("Plug '3rd/image.nvim'")
--vim.cmd [[Plug '3rd/image.nvim']]
--+Plug '3rd/image.nvim'

vim.cmd("call plug#end()")

-- Enable true colors (24-bit)
vim.opt.termguicolors = true

-- Configure Catppuccin (choose flavor: latte, frappe, macchiato, mocha)
require('catppuccin').setup({
  flavour = "mocha",  -- Default flavor
  transparent_background = true,  -- Set to true for transparency
  styles = {
    comments = { "italic" },  -- Customize comment style
    keywords = { "bold" },
  }
})

-- Apply the theme
vim.cmd.colorscheme("catppuccin")

-- Setup Mason
require("mason").setup()

-- File Explorer
require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    local image = require("image")

    local function preview_image_on_select()
      local node = api.tree.get_node_under_cursor()
      if node and node.absolute_path then
        local path = node.absolute_path
        -- Only attempt to preview image files
        if path:match("%.png$") or path:match("%.jpg$") or path:match("%.jpeg$") then
          -- Add error handling and proper buffer management
          pcall(function()
            image.show(path, {
              buffer = bufnr,
              backend = "kitty",
              with_virtual_padding = true,
              window_overlap = "allow"
            })
          end)
        end
      end
    end

    vim.keymap.set("n", "<CR>", function()
      preview_image_on_select()
      api.node.open.edit()
    end, { buffer = bufnr })
  end,
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Fuzzy Finser
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Status Line
require("lualine").setup({
  options = {
    theme = "auto",
    section_separators = "",
    component_separators = "",
  },
})

-- Syntax Highlighting
require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "javascript", "html", "css" }, -- Add languages as needed
  highlight = { enable = true },
})

-- Git Intergration
require("gitsigns").setup()

-- Commenting Utility
require("Comment").setup()

-- Terminal
require("toggleterm").setup{
	direction = 'float', -- or 'horizontal', 'vertical'
  	open_mapping = [[<c-\>]]
}

require("image").setup({
  backend = "kitty",  -- use kitty backend
  integrations = {
    markdown = { enabled = true },
  },
})


require("config.lsp")
require("config.cmp")
require("keymaps")
require("config.alpha")
-- image
require("config.image")
require("config.autopreview")
