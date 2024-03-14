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

-- vim.o.background = "light"

--https://github.com/neovim/neovim/issues/19648
vim.cmd("set shell=nu")
vim.cmd("set shellcmdflag=-c")
vim.cmd("set shellquote")
vim.cmd("set shellxquote")


vim.cmd("set wrap!")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set hidden")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.wo.relativenumber = true

-- CUSTOM COMMANDS
vim.api.nvim_create_user_command("EditConfig", "tabedit ~\\AppData\\Local\\nvim\\init.lua", {})

-- KEYBINDINGS

vim.api.nvim_set_keymap("n", "<tab>", ":bnext<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<s-tab>", ":bprevious<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<C-d>", ":bdelete<CR>", {})

vim.api.nvim_set_keymap("n", "<leader>i", ":lua vim.diagnostic.open_float()<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>n", ":lua vim.diagnostic.goto_next()<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>e", ":Ve!<CR>", {silent = true})

-- exit terminal typing mode with escape
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])



-- makes background transparent
-- from: https://www.reddit.com/r/neovim/comments/3v06lo/making_the_background_transparent/
--vim.cmd("highlight Normal guibg=none")
--vim.cmd("highlight NonText guibg=none")

-- disables comments continuing on newlines.
-- from https://superuser.com/questions/271023/can-i-disable-continuation-of-comments-to-the-next-line-in-vim
vim.cmd("autocmd FileType * set formatoptions-=cro")

vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

require("lazy").setup({
	-- THEMES
	{"morhetz/gruvbox", lazy = false, priority = 1000},
	{"folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },
	{"catppuccin/nvim", name = "catppuccin", lazy=false, priority = 1000 },
	{"rose-pine/neovim", name = "rose-pine"},
	{"rebelot/kanagawa.nvim", name = "kanagawa"},

    {"HiPhish/rainbow-delimiters.nvim"},

    -- FUNNY
    {"eandrju/cellular-automaton.nvim"},


	{"nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" }},
	{"nvim-lualine/lualine.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}},
	{"nvim-treesitter/nvim-treesitter", dependencies = {{"nushell/tree-sitter-nu"}}, build = ":TSUpdate"},

	-- LSP
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"neovim/nvim-lspconfig"},

    -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
    },
})

-- COLORSCHEME
vim.cmd "colorscheme catppuccin"

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
vim.keymap.set("n", "<leader>fe", builtin.diagnostics, {})

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "auto",

        component_separators = { left = "", right = ""},
        section_separators = { left = "", right = ""},

        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {"filename"},

        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},

        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },

    tabline = {
        lualine_a = {"buffers"},

        lualine_z = {"tabs"},

    },
    winbar = {
    },
    inactive_winbar = {},
    extensions = {}
}

-- recognise slint filetypes
vim.cmd("autocmd BufEnter *.slint :setlocal filetype=slint")

require("nvim-treesitter.configs").setup {
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

require("mason-lspconfig").setup_handlers({
  function(server)
    lspconfig[server].setup({})
  end,
})
--]]

local lspconfig = require("lspconfig")
lspconfig.pyright.setup {
	settings = {
		pyright = {
			typeCheckingMode = "off"
		}
	}
}

lspconfig.rust_analyzer.setup {
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                disabled = {"needless_return"}
            }
        }
    }
}
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
local cmp = require("cmp")

cmp.setup({

    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
        --documentation = false;

    },

    view = {
        docs = {
            auto_open = false
        }
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        --["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --["<CR>"] = cmp.mapping.open_docs()
        ["<C-g>"] = function()
        if cmp.visible_docs() then
          cmp.close_docs()
        else
          cmp.open_docs()
        end
      end,


    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" }, -- For luasnip users.
        -- { name = "orgmode" },
    }, {
        { name = "buffer" },
        { name = "path" },
    }),
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})


