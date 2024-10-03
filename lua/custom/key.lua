-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<F2>t', "i<C-R>=strftime('%F %T')<CR><CR><Esc>", { noremap = true, desc = 'time stamp' })

vim.keymap.set('n', '<C-Right>', "gUlw", { noremap = true, desc = 'title case forward' })
vim.keymap.set('n', '<C-Left>', "F lgUlh", { noremap = true, desc = 'title case backward' })

vim.keymap.set('n', '<M-Up>', "<cmd>:m -2<cr>", { noremap = true, desc = 'move up current line by 1' })
vim.keymap.set('n', '<M-Down>', "<cmd>:m +1<cr>", { noremap = true, desc = 'move down current line by 1' })

vim.keymap.set('n', '<leader>trm', '<cmd>botright 10 new +term<cr>', { noremap = true, desc = 'terminal' })

-- vim.keymap.set('x', 'hello', function()
-- 	vim.print(vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.'), { type = vim.fn.mode() }))
-- end)

vim.keymap.set('n', '<leader>psc', 'f_a<bs><esc>lgUl', { noremap = true, desc = 'one PascalCase' })

-- auto closing
-- TODO: string format
local opens = {
	{ '{',     '{}<left>' },
	{ '[',     '[]<left>' },
	{ '(',     '()<left>' },
	{ "'",     "''<left>" },
	{ '"',     '""<left>' },
	{ '<',     '<lt>><left>' },
	{ '{<cr>', '{}<left><cr><esc>O' },
	{ '[<cr>', '[]<left><cr><esc>O' },
	{ '(<cr>', '()<left><cr><esc>O' },
}
for _, item in ipairs(opens) do
	vim.keymap.set('i', item[1], item[2], {
		noremap = true,
		desc = string.format('auto closing for "%s"', item[1]),
	})
end

local wraps = {
	{ '<leader>{', 'c{}<esc>P' },
	{ '<leader>[', 'c[]<esc>P' },
	{ '<leader>(', 'c()<esc>P' },
	{ "<leader>'", "c''<esc>P" },
	{ '<leader>"', 'c""<esc>P' },
	{ '<leader><', 'c<lt>><esc>P' },
}
for _, item in ipairs(wraps) do
	vim.keymap.set('x', item[1], item[2], { noremap = true, desc = 'wrap text' })
end
