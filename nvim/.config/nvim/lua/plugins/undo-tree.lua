
return {
  "mbbill/undotree",
  config = function ()
    vim.keymap.set('n', '<leader>ut', ":UndotreeShow<CR>:UndotreeFocus<CR>")
  end
}

