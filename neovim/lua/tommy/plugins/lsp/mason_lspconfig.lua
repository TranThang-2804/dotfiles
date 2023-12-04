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
      "clangd",
      "jdtls",
      "docker_compose_language_service",
      "dockerls",
      "yamlls"
    }
  }
}
