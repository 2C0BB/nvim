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

