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
      { "th", "<cmd>ToggleTerm size=60 direction=horizontal<cr>", desc = "Open a horizontal terminal" },
      { "tv", "<cmd>ToggleTerm size=40 direction=vertical<cr>", desc = "Open a vertical terminal" },

      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Open a float terminal" },
      { "<C-_>", "<cmd>ToggleTerm direction=float<cr>", desc = "Open a float terminal" },
    },
  },
}
