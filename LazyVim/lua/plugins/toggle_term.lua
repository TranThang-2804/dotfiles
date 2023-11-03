return {
  -- amongst your other plugins
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    keys = {
      { "<leader>th", "<cmd>ToggleTerm size=40 direction=horizontal<cr>", desc = "Open a horizontal terminal" },
      { "<leader>tv", "<cmd>ToggleTerm size=40 direction=vertical<cr>", desc = "Open a vertical terminal" },

      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Open a float terminal" },
      { "<C-_>", "<cmd>ToggleTerm direction=float<cr>", desc = "Open a float terminal" },
      { "<C-/>", "<cmd>ToggleTerm direction=float<cr>", desc = "Open a float terminal" },
    },
  },
  -- or
  -- {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}}
}
