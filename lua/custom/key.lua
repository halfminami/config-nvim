-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<F2>t', "i<C-R>=strftime('%F %T')<CR><CR><Esc>", { noremap=true, desc='time stamp' })

vim.keymap.set('n', '<C-Right>', "gUlw", { noremap=true, desc='title case forward' })
vim.keymap.set('n', '<C-Left>', "F lgUlh", { noremap=true, desc='title case backward' })

-- auto closing
local opens = {
	{'{', '{}<left>'},
	{'[', '[]<left>'},
	{'(', '()<left>'},
	{"'", "''<left>"},
	{'"', '""<left>'},
	{'<', '<lt>><left>'},
	{'{<cr>', '{}<left><cr><esc>O'},
	{'[<cr>', '[]<left><cr><esc>O'},
	{'(<cr>', '()<left><cr><esc>O'},
}
for _, item in ipairs(opens) do
	vim.keymap.set('i', item[1], item[2], {
		noremap=true,
		desc=string.format('auto closing for "%s"', item[1]),
	})
end

