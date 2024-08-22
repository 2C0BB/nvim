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
    on_attach = function (client, bufnr)
        vim.lsp.inlay_hint.enable(true, {bufnr})
    end,
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                disabled = {"needless_return"}
            },
            checkOnSave = {
                enable = true,
                command = "clippy"
            }
        }
    }
}
lspconfig.lua_ls.setup {}
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
lspconfig.html.setup {}

lspconfig.volar.setup {}
lspconfig.tsserver.setup {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "%userprofile%/AppData/Roaming/npm/node_modules/@vue/typescript-plugin",
        languages = {"javascript", "typescript", "vue"},
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
}


--[[
lspconfig.volar.setup {
    --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    init_options = {
      vue = {
        hybridMode = false,
        checkOnSave = true,
      },
    },
}
--]]

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        lsp_name = client.name
        require("lualine").refresh()
    end
})
