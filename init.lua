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

vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("lazy").setup({
	--{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},

	-- THEMES
	{'morhetz/gruvbox'},
	{"folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{'rose-pine/neovim', name = 'rose-pine'},
	{'rebelot/kanagawa.nvim', name = 'kanagawa'},


	--{"nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" }},
	{"nvim-lualine/lualine.nvim"},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

	-- LSP
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"neovim/nvim-lspconfig"},

})

require('lualine').setup {
    --[[
    options = {
        theme = 'gruvbox',
    },
    --]]
}

require'nvim-treesitter.configs'.setup {
	auto_install = true,
	highlight = {
		enable = false,
	},
    indent = {
        enable = false,
    }
}

local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup()

--[[
FOR AUTO ENABLING SERVERS

require('mason-lspconfig').setup_handlers({
  function(server)
    lspconfig[server].setup({})
  end,
})
--]]

local lspconfig = require('lspconfig')
lspconfig.pyright.setup {
	settings = {
		pyright = {
			typeCheckingMode = 'off'
		}
	}
}

lspconfig.rust_analyzer.setup {}
lspconfig.hls.setup {}
lspconfig.clangd.setup {}

-- vim.o.background = "light"
vim.cmd "colorscheme catppuccin-mocha"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.wo.relativenumber = true

-- since i am using lualine, i don't want the extra status line
--vim.opt.showmode = false

-- KEYBINDINGS
vim.api.nvim_set_keymap("n", "<leader>i", ":lua vim.diagnostic.open_float()<CR>", {})

-- exit terminal typing mode with escape
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

vim.keymap.set("n", "<leader>b", ":ls<CR>:b<space>", {noremap = true})


-- makes background transparent
-- from: https://www.reddit.com/r/neovim/comments/3v06lo/making_the_background_transparent/
--vim.cmd("highlight Normal guibg=none")
--vim.cmd("highlight NonText guibg=none")

-- centers windows on cursor
-- from: https://stackoverflow.com/questions/64280931/keep-cursor-line-vertically-centered-in-vim
--vim.cmd("set scrolloff=999")

-- disables comments continuing on newlines.
-- from https://superuser.com/questions/271023/can-i-disable-continuation-of-comments-to-the-next-line-in-vim
vim.cmd("autocmd FileType * set formatoptions-=cro")
