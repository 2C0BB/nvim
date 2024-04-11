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
lspconfig.tsserver.setup {}

--[[
vim.api.nvim_create_autocmd({"LspProgress"}, {
    callback = function()
        print("lsp progress")
    end,
})
--]]



vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        lsp_name = client.name
        require("lualine").refresh()
    end
})
