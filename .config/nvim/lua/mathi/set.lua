vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25-blinkon1,r-cr-o:hor20"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
if os.getenv("HOME") then
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
else
    vim.opt.undodir = os.getenv("USERPROFILE") .. "/.vim/undodir"
end
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.list = true

vim.opt.concealcursor = 'nc'
vim.opt.conceallevel = 2
