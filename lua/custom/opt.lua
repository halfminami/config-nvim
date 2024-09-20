vim.opt.undofile = true

-- lines
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- incremental search
vim.opt.is = true

-- set rtp^="~/.opam/default/share/ocp-indent/vim"
vim.opt.rtp:prepend("~/.opam/default/share/ocp-indent/vim")
-- not sure
