return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  config = true,
  -- stylua: ignore
  keys = {
    { "<leader>jt", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "<leader>kt", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    { "<leader>xt", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>st", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo" },
  },
}
