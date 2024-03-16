return {
	-- THEMES
	--{"morhetz/gruvbox", lazy = false, priority = 1000},
	--{"folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },
	--{"rose-pine/neovim", name = "rose-pine"},
	--{"rebelot/kanagawa.nvim", name = "kanagawa"},
	{"catppuccin/nvim", name = "catppuccin", lazy=false, priority = 1000,
        config = function()
            vim.cmd("colorscheme catppuccin")
        end,
    },
    {"HiPhish/rainbow-delimiters.nvim"},

    -- FUNNY
    {"eandrju/cellular-automaton.nvim",
        config = function()
            vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
        end,
    },


	{"nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
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
        end,
    },
	{"nvim-lualine/lualine.nvim", dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
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
        end,
    },
	{"nvim-treesitter/nvim-treesitter", dependencies = {{"nushell/tree-sitter-nu"}}, build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                auto_install = true,
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = false,
                }
            }
        end,
    },

	-- LSP
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"neovim/nvim-lspconfig",
        config = function()
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
        end,
    },

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
        config = function()
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
        end,
    },
}
