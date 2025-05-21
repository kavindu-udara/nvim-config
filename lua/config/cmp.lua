local cmp = require("cmp")
cmp.setup({
  sources = {
    { name = "nvim_lsp" }, -- LSP completions
    { name = "luasnip" },  -- Snippets
    { name = "buffer" },   -- Current buffer text
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
})

