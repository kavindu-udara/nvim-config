return {
  -- Plugin manager
  {
    "folke/lazy.nvim",
    config = function()
      require("lazy").setup("plugins")
    end,
  },

  -- Mason for managing external tools
  {
    "williamboman/mason.nvim",
    opts = {}
  },

  -- Mason LSP config for integrating Mason with lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "pyright", "tsserver" },
      automatic_installation = true,
    },
    config = true
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({})
        end,
      })
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    },

{
    "hrsh7th/cmp-nvim-lsp",
    },
    {
    "hrsh7th/cmp-buffer",
    },
    {
    "hrsh7th/cmp-path",
    },
    {
    "hrsh7th/cmp-cmdline",
    },
    {
    "L3MON4D3/LuaSnip",
    },
    {
    "saadparwaiz1/cmp_luasnip",
    }
  }
  },

  -- File Navigation
  {
    "nvim-telescope/telescope.nvim",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
  },

  -- Syntax & UI
  {
    "nvim-treesitter/nvim-treesitter",
  },
  {
    "nvim-lualine/lualine.nvim",
  },

  -- Debugging
  {
    "mfussenegger/nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
  },

  -- Git
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
  },
}

