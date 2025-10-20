vim.api.nvim_set_hl(0, "LineNr", { fg = "black" })
vim.opt.number = true

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

vim.opt.guicursor = {
	"n-v-c:block",
	"i:block-blinkwait700-blinkoff400-blinkon250",
	"a:blinkwait700-blinkoff400-blinkon250",
}

-- Error Stuff
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = { current_line = true },
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.opt.mouse = ""

vim.cmd("source ~/.vimrc")

-- options.lua
vim.opt.completeopt = { "menuone", "noselect", "menu" }

-- indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
