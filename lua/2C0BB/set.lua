--https://github.com/neovim/neovim/issues/19648
--vim.cmd("set shell=nu")
--vim.cmd("set shellcmdflag=-c")
--vim.cmd("set shellquote")
--vim.cmd("set shellxquote")

vim.cmd("set wrap!")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set hidden")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.wo.relativenumber = true

