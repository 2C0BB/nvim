vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- NO ARROW KEYS!
vim.api.nvim_set_keymap("i", "<Up>", "<NOP>", {noremap = true})
vim.api.nvim_set_keymap("i", "<Down>", "<NOP>", {noremap = true})
vim.api.nvim_set_keymap("i", "<Left>", "<NOP>", {noremap = true})
vim.api.nvim_set_keymap("i", "<Right>", "<NOP>", {noremap = true})

vim.api.nvim_set_keymap("n", "<Up>", "<NOP>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Down>", "<NOP>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Left>", "<NOP>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Right>", "<NOP>", {noremap = true})
--[[

Matthew 5:30

And if your right hand causes you to sin, cut it off and throw it away.
For it is better that you lose one of your members than that your whole body go into hell.

--]]

vim.api.nvim_set_keymap("n", "<tab>", ":bnext<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<s-tab>", ":bprevious<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<C-d>", ":bdelete<CR>", {})

vim.api.nvim_set_keymap("n", "<leader>i", ":lua vim.diagnostic.open_float()<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>n", ":lua vim.diagnostic.goto_next()<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>e", ":Ve!<CR>", {silent = true})

-- exit terminal typing mode with escape
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
