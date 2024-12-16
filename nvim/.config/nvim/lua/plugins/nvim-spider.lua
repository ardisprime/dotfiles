
return {
  "chrisgrieser/nvim-spider",
  keys = {
    {
      "w",
      "<cmd>lua require('spider').motion('w')<CR>",
      mode = {"n", "v"}
    },
    {
      "e",
      "<cmd>lua require('spider').motion('e')<CR>",
      mode = {"n", "v"}
    },
    {
      "b",
      "<cmd>lua require('spider').motion('b')<CR>",
      mode = {"n", "v"}
    },
  }
}

