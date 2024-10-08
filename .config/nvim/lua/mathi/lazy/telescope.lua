return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    config = function()
        require('telescope').setup({
            pickers = {
                buffers = {
                    ignore_current_buffer = true,
                    sort_lastused = true,
                }
            }
        })
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = "Show current buffers" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

		vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, {desc = "Search symbols on file"});
		vim.keymap.set('n', '<leader>sS', builtin.lsp_document_symbols, {desc = "Search symbols on workspace"});
    end
}
