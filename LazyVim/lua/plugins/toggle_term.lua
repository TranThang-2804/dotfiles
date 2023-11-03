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
      {
        "<leader>th",
        '<cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>',
        desc = "Open a horizontal terminal",
      },
      { "<leader>tv", '<cmd>exe v:count1 . "ToggleTerm direction=vertical"<CR>', desc = "Open a vertical terminal" },
    },
  },
}
