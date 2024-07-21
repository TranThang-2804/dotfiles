return {
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  opts = { use_diagnostic_signs = true },
  keys = {
    { "<leader>xx", "<cmd>Trouble document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    { "<leader>xl", "<cmd>Trouble loclist<cr>",               desc = "Location List (Trouble)" },
    { "<leader>xq", "<cmd>Trouble quickfix<cr>",              desc = "Quickfix List (Trouble)" },
    {
      "<leader>kq",
      function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
        end
      end,
      desc = "Previous trouble/quickfix item",
    },
    {
      "<leader>jq",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
        end
      end,
      desc = "Next trouble/quickfix item",
    },
  },
}
