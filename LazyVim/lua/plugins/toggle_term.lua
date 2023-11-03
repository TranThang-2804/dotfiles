local function openFloatTerminal(number, direction)
  vim.cmd(":" .. number .. "ToggleTerm direction=")
end
return {
  -- amongst your other plugins
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    keys = {
      { "th", "<C-/-h>", desc = "Open a horizontal terminal" },
      { "tv", "<C-/-v>", desc = "Open a vertical terminal" },
      { "<C-/-h>", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Open a horizontal terminal" },
      { "<C-/-v>", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Open a vertical terminal" },

      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Open a float terminal" },
      { "<C-_>", "<cmd>ToggleTerm direction=float<cr>", desc = "Open a float terminal" },
    },
  },
}
