return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "gopls",
      "terraformls",
      "tflint",
      "lua_ls",
      "tsserver",
      "eslint",
      "java_language_server",
      "clangd"
    }
  }
}
