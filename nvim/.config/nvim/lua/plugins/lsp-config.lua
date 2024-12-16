return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        registries = {
          "github:mason-org/mason-registry@2024-12-02-awful-nerve"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities
      })
      lspconfig.jedi_language_server.setup({
        capabilities = capabilities
      })
      -- keymaps
      -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {} );
      -- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {} );
      vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {} );
    end
  },
}
