local builtin = require("telescope/builtin")

vim.keymap.set("n", "<F2>", vim.cmd.Ex)

vim.keymap.set("n", "<F4>", vim.cmd.bdelete)

vim.keymap.set("n", "<C-p>", builtin.find_files, {})

vim.keymap.set("n", "<F8>", builtin.buffers, {})
vim.keymap.set("n", "<leader>f", builtin.live_grep, {})


vim.keymap.set("n", "<A-i>", function () require("nvterm.terminal").toggle('float') end , {})

-- VISUAL MODE: MOVE TEXT BLOCK
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
