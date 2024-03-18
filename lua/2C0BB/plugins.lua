return {
	-- THEMES
    {"sainnhe/gruvbox-material", name = "gruvbox-material", lazy = false, priority = 1000},
	--{"morhetz/gruvbox", lazy = false, priority = 1000},
	--{"folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },
	--{"rose-pine/neovim", name = "rose-pine"},
	--{"rebelot/kanagawa.nvim", name = "kanagawa"},
	--{"catppuccin/nvim", name = "catppuccin", lazy=false, priority = 1000},

    {"HiPhish/rainbow-delimiters.nvim"},

    -- FUNNY
    {"eandrju/cellular-automaton.nvim",
        config = function()
            vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
        end,
    },


	{"nvim-lualine/lualine.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}},
    --{"arkav/lualine-lsp-progress"},

	{"nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" }},
    {"tpope/vim-fugitive"},
	{"nvim-treesitter/nvim-treesitter", dependencies = {{"nushell/tree-sitter-nu"}}, build = ":TSUpdate"},
    {"m4xshen/hardtime.nvim", dependencies = {"MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim"}},

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
}
