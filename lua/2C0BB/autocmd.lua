-- disables comments continuing on newlines.
-- from https://superuser.com/questions/271023/can-i-disable-continuation-of-comments-to-the-next-line-in-vim
vim.cmd("autocmd FileType * set formatoptions-=cro")

-- recognise slint filetypes
vim.cmd("autocmd BufEnter *.slint :setlocal filetype=slint")

