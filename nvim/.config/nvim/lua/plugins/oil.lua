
return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function ()
    local oil = require("oil")
    oil.setup({
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = true,
      watch_for_changes = true,
      columns = {
        "icon",
        "size"
      },
      keymaps = {
        ["<S-l>"] = "actions.select",
        ["<S-h>"] = "actions.parent",
        ["gh"] = { "actions.toggle_hidden", mode = "n" },
      },
      use_default_keymaps = false,
      view_options = {
        show_hidden = true
      },
      float = {
        padding = 10,
      },
    })
  end
}

