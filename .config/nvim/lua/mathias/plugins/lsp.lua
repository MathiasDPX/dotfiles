return {
  {
    "neovim/nvim-lspconfig",
    config = function()
        require("lspconfig").lua_ls.setup({})
	require("lspconfig").pyright.setup({})
	require("lspconfig").html.setup({})
	require("lspconfig").tailwindcss.setup({})
	require("lspconfig").ruby_lsp.setup({})
	require("lspconfig").gopls.setup({})
    end,
  }
}

