return{
  {
	"williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
},
{ 
  "williamboman/mason-lspconfig.nvim",
  config = function()
    local config = require("mason-lspconfig")
    config.setup({
	    ensure_installed = { "lua_ls", "clangd", "cmake", "pyright" },
})
  end
},
{ 
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({
	    capabilities = capabilities,
    })
    lspconfig.pyright.setup({
	    capabilities = capabilities,
    })

    vim.keymap.set("n", "k", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action, {})

 end
  }
}

	

