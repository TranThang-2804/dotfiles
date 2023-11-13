return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "gopls",
      "terraformls",
      "tflint",
      "lua_ls"
    }
  }
}
