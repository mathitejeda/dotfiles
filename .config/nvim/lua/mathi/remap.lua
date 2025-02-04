vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/mathi/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
-- Emacs like saves and stuff
vim.keymap.set("n", "<leader>fs", ":w<CR>");
vim.keymap.set("n", "<leader>wq", ":wq<CR>")

--Window navigation
vim.keymap.set("n", "<leader>wh", "<C-W>n", { desc = "nueva ventana horizontal" })
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "nueva ventana vertical" })

vim.keymap.set("n", "H", "<C-W>h")
vim.keymap.set("n", "J", "<C-W>j")
vim.keymap.set("n", "K", "<C-W>k")
vim.keymap.set("n", "L", "<C-W>l")
vim.keymap.set("n", "<leader>wc", ":q<CR>", { desc = "Cerrar ventana" })

-- buffers ketys

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "goto next buffer" })      -- next buffer
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "goto prev buffer" })      -- previous buffer
vim.keymap.set("n", "<leader>bk", ":bdelete<CR>", { desc = "kill current buffer" }) -- kill current buffer

vim.keymap.set("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- copilot keys

vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-S-y>', '<Plug>(copilot-accept-word)')

-- exit terminal
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>")
vim.keymap.set("n", "<space>ot", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.cmd("startinsert")
	vim.api.nvim_win_set_height(0, 10)
end)

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

vim.keymap.set('v', '<Leader>f', vim.lsp.buf.format, bufopts)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- mini files
vim.keymap.set("n", "<leader>of", "<cmd>lua MiniFiles.open()<CR>", { desc = "mini files" })
