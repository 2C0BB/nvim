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

    {'HiPhish/rainbow-delimiters.nvim'},

	{"nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" }},
	{"nvim-lualine/lualine.nvim"},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

	-- LSP
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"neovim/nvim-lspconfig"},

    -- Autocomplete
    --{"https://github.com/hrsh7th/nvim-cmp"},
})

require("telescope").setup {
    defaults = {
        file_ignore_patterns = {
            ".git",
            "target",
        }
    }
}

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

require('lualine').setup {
    options = {
        theme = 'gruvbox',
    },
}

-- recognise slint filetypes
vim.cmd("autocmd BufEnter *.slint :setlocal filetype=slint")

require('nvim-treesitter.configs').setup {
	auto_install = true,
	highlight = {
		enable = true,
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
lspconfig.slint_lsp.setup {
    settings = {
        slint_lsp = {
            filetypes = {"slint"},
            command = {"slint-lsp"},
        }
    }
}

-- setup autocomplete
--local cmp = require("cmp")

-- vim.o.background = "light"
vim.cmd "colorscheme gruvbox"
vim.cmd("set wrap!")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.wo.relativenumber = true

-- since i am using lualine, i don't want the extra status line
--vim.opt.showmode = false

-- CUSTOM COMMANDS
vim.api.nvim_create_user_command("EditConfig", "tabedit ~\\AppData\\Local\\nvim\\init.lua", {})

-- KEYBINDINGS
vim.api.nvim_set_keymap("n", "<leader>i", ":lua vim.diagnostic.open_float()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>n", ":lua vim.diagnostic.goto_next()<CR>", {})

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