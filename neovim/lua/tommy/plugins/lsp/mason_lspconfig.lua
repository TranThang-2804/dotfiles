return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "gopls",
      "terraformls",
      "lua_ls"
    }
  }
}
