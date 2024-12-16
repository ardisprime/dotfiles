
return {
  "norcalli/nvim-colorizer.lua",
  config = function ()
    require("colorizer").setup({
      "*";
    }, {
        RRGGBBAA = true;
        css = true;
        css_fn = true;
      })
  end
}

