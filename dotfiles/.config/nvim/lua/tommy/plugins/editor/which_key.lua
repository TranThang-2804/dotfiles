return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  version = "v2.1.0",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 1000
  end,
  opts = {
    plugins = { spelling = true },
    keys = {
      mode = { "n", "v" },
      { "<leader><tab>", desc = "tabs" },
      { "<leader>a",     desc = "ai suggest" },
      { "<leader>b",     desc = "buffer" },
      { "<leader>c",     desc = "code" },
      { "<leader>f",     desc = "file/find" },
      { "<leader>g",     desc = "git" },
      { "<leader>gh",    desc = "hunks" },
      { "<leader>i",     desc = "in line action" },
      { "<leader>j",     desc = "next action" },
      { "<leader>k",     desc = "prev action" },
      { "<leader>l",     desc = "leetcode" },
      { "<leader>m",     desc = "markdown note" },
      { "<leader>q",     desc = "quit/session" },
      { "<leader>s",     desc = "search" },
      { "<leader>u",     desc = "ui" },
      { "<leader>w",     desc = "windows" },
      { "<leader>x",     desc = "diagnostics/quickfix" },
      { "[",             desc = "prev" },
      { "]",             desc = "next" },
      { "g",             desc = "goto" },
      { "gs",            desc = "surround" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.keys)
  end,
}
