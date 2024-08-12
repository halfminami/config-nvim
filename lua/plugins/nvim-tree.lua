-- Nvim Tree
-- https://github.com/nvim-tree/nvim-tree.lua

-- from help file
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<leader>ntt', '<cmd>NvimTreeToggle<cr>', {noremap=true, desc='toggle tree'})
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {on_attach = my_on_attach},
}

