return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set("n", "<leader>gs", ":Git<CR>")
        vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR>")
        vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
        vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
        vim.keymap.set("n", "<leader>gp", ":Git push<CR>")
        vim.keymap.set("n", "<leader>gl", ":Git pull<CR>")
    end
}
