return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = true,
  keys = {
    {
      "<leader>th",
      '<cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>',
      desc = "Open a horizontal terminal",
    },
    {
      "<leader>tv",
      '<cmd>exe v:count1 . "ToggleTerm direction=vertical size=40"<CR>',
      desc = "Open a vertical terminal",
    },
    {
      "<C-t>",
      "<cmd>ToggleTerm direction=float<CR>",
      desc = "Open a float terminal",
    },
  },
}
