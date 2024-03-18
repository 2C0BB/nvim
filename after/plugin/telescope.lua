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

vim.api.nvim_create_user_command("EditConfig", function()
    builtin.find_files({cwd = "~\\AppData\\Local\\nvim"})
end, {})
