require("2C0BB/set")
require("2C0BB/remap")


-- disables comments continuing on newlines.
-- from https://superuser.com/questions/271023/can-i-disable-continuation-of-comments-to-the-next-line-in-vim
vim.cmd("autocmd FileType * set formatoptions-=cro")

-- recognise slint filetypes
vim.cmd("autocmd BufEnter *.slint :setlocal filetype=slint")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup({
    {import = "2C0BB/plugins"}
})

--vim.cmd("intro")
