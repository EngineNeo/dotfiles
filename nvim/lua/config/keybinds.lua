vim.g.mapleader = " "

-- Telescope Stuff
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

vim.opt.clipboard = "unnamedplus"

-- Conform (Formating)
vim.keymap.set("n", "<leader>lf", function() require("conform").format() end)
