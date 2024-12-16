
-- setting indent
vim.cmd[[
set expandtab
set tabstop=2
set softtabstop=0
set shiftwidth=0
]]
-- search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
-- yanking to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+yy")
-- set relative lines
vim.cmd("set relativenumber")
-- disable line wrap
vim.cmd("set nowrap")
-- set leader to space
vim.g.mapleader = " "

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- setup lazy with plugins folder 
require("lazy").setup("plugins")

-- setup telescop
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {} )
vim.keymap.set("n", "<leader>lg", builtin.live_grep, {} )

-- setup treesitter 
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "c", "cpp"},
  highlight = {enable = true},
  indent = {enable = true},
})

-- add remaps for moving up and down
vim.cmd("nmap <C-d> <C-d>zz")
vim.cmd("nmap <C-u> <C-u>zz")
-- add remaps for switching windows
vim.cmd("nmap <leader>wh <C-w>h")
vim.cmd("nmap <leader>wj <C-w>j")
vim.cmd("nmap <leader>wk <C-w>k")
vim.cmd("nmap <leader>wl <C-w>l")
-- keymaps for floaterm
vim.keymap.set("n", "<leader>t", ":FloatermNew --width=0.8 --height=0.8<CR>")
-- set color scheme
vim.cmd.colorscheme("everforest")
-- fix indent
vim.keymap.set("n", "<leader>=", "mmgg=G'm")
-- exit insert quicker
vim.keymap.set("i", "<C-c>", "<Esc>")
-- delete buffer shortcut
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")
-- select changed text shortcut
vim.keymap.set("n", "<leader>s", "`[v`]")
-- move character shortcut
vim.keymap.set("n", "<S-h>", "dlhP")
vim.keymap.set("n", "<S-l>", "dlp")
vim.keymap.set("v", "<S-h>", "dhP`[v`]")
vim.keymap.set("v", "<S-l>", "dp`[v`]")
-- move line shortcut
vim.keymap.set("n", "<S-j>", ":m +1<CR>")
vim.keymap.set("n", "<S-k>", ":m -2<CR>")
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv")
-- remove windows newlines
vim.keymap.set("n", "<leader>rm", ":%s/\r$<CR>")
-- duplicate line
vim.keymap.set("n", "<S-d>", "yyp")
-- set python host prog
vim.g.python3_host_prog = "/usr/sbin/python3"
-- shortcut for line wrap 
vim.cmd("set linebreak")
vim.keymap.set("n", "<leader>lw", ":set wrap!<CR>")
-- open oil
vim.keymap.set("n", "<leader>o", ":lua require\"oil\".toggle_float()<CR>")
-- shortcut for zz and zq to all files
vim.keymap.set("n", "ZZ", ":wqa<CR>")
vim.keymap.set("n", "ZQ", ":qa!<CR>")
















