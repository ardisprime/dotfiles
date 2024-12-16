
-- activate molten and quatro
vim.cmd("MoltenInit python3")
vim.cmd("QuartoActivate")
-- set keybinds
vim.keymap.set("n", "<C-n>", ":MoltenNext<CR>")
vim.keymap.set("n", "<C-p>", ":MoltenPrev<CR>")
vim.keymap.set("v", "<leader>rv", ":<C-u>MoltenEvaluateVisual<CR>gv")
vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>")
local runner = require("quarto.runner")
vim.keymap.set("n", "<leader>rc", runner.run_cell)

