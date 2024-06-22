-- Nvim Tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Metals Scala language Server
-- https://github.com/scalameta/nvim-metals/discussions/39
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F")

-- Lazy
-- https://github.com/folke/lazy.nvim#-installation
if vim.g.mapleader == nil then
	vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
end
if vim.g.maplocalleader == nil then
	vim.g.maplocalleader = "\\" -- Same for `maplocalleader`
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')


