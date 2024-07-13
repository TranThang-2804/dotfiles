return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "*",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  keys = {
    {
      "<leader>mf",
      function()
        return require("obsidian").util.gf_passthrough()
      end,
      desc = "passthrough"
    },
    {
      "<leader>mcb",
      function()
        return require("obsidian").util.toggle_checkbox()
      end
      ,
      desc = "toggle checkbox"
    },
    { "<leader>mq", "<cmd>ObsidianQuickSwitch<CR>", desc = "quick switch" },
    { "<leader>md", "<cmd>ObsidianToday<cr>",       desc = "today note" },
    { "<leader>mm", "<cmd>ObsidianTomorrow<cr>",    desc = "tomorrow note" },
    { "<leader>my", "<cmd>ObsidianYesterday<cr>",   desc = "yesterday note" },
    { "<leader>mn", "<cmd>ObsidianNew<cr>",         desc = "new note" },
    { "<leader>ms", "<cmd>ObsidianSearch<cr>",      desc = "search" },
    { "<leader>mp", "<cmd>ObsidianPasteImage<cr>",  desc = "paste image" },
  },
  opts = {
    workspaces = {
      {
        name = "tommy-note-vault",
        path = "~/Documents/Note",
      },
    },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "notes/dailies",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%d-%m-%Y",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil
    },
  },
}
