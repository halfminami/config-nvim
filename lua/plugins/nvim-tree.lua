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
  -- ???
  -- vim.keymap.set('n', '<leader>to',     '<cmd>NvimTreeOpen',                  opts('Open the tree'))
  -- vim.keymap.set('n', '<leader>tc',     api.tree.close,                  opts('Close the tree'))
-- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      on_attach = my_on_attach,
    }
  end,
}

