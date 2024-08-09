-- Nvim Tree
-- https://github.com/nvim-tree/nvim-tree.lua

-- from help file
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.api.nvim_set_keymap('n', '<C-E>',     '<cmd>NvimTreeOpen<CR>', {noremap = true})
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

