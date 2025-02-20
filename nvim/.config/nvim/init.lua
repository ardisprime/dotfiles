
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

-- enabling terminal colors
vim.opt.termguicolors = true
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

-- WINDOW SHORTCUTS
-- add remaps for switching windows
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
-- add remaps for creating and closing windows
vim.keymap.set("n", "<leader>wu", ":vsplit<CR><C-w>l")
vim.keymap.set("n", "<leader>wi", ":split<CR><C-w>j")
vim.keymap.set("n", "<leader>wq", ":q<CR>")
-- zen mode toggle
vim.keymap.set("n", "<leader>zt", ":ZenMode<CR>")

-- TERMINAL SHORTCUTS
-- shortcut for opening terminal
vim.keymap.set("n", "<leader>to", ":term<CR>i")
vim.keymap.set("n", "<leader>tu", ":vsplit<CR><C-w>l:term<CR>i")
vim.keymap.set("n", "<leader>ti", ":split<CR><C-w>j:term<CR>i")
-- quit terminal mode shortcut 
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- MOVE SHORTCUTS
-- add remaps for moving up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
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
  
-- SYSTEM CLIPBOARD
vim.keymap.set("v", "<leader>cy", "\"+y")
vim.keymap.set("n", "<leader>cy", "\"+y")
vim.keymap.set("n", "<leader>cl", "\"+yy")
vim.keymap.set("n", "<leader>cp", "\"+p")

-- LINE MANIPULATION
-- duplicate line
vim.keymap.set("n", "<leader>lc", "yyp")
-- shortcut for line wrap 
vim.cmd("set linebreak")
vim.keymap.set("n", "<leader>lw", ":set wrap!<CR>")
-- fix line indent on full file shortcut
vim.keymap.set("n", "<leader>=", "mmgg=G'mzz")

-- exit insert quicker
vim.keymap.set("i", "<C-c>", "<Esc>")
-- open oil
vim.keymap.set("n", "<leader>o", ":lua require\"oil\".toggle_float()<CR>")
-- shortcut for zz and zq to all files
vim.keymap.set("n", "ZZ", ":wqa<CR>")
vim.keymap.set("n", "ZQ", ":qa!<CR>")

-- set color scheme
vim.opt.termguicolors = false
vim.cmd.colorscheme('dim')











