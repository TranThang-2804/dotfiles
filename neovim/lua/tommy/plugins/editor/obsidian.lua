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
  opts = {
    workspaces = {
      {
        name = "tommy-note-vault",
        path = "/Users/tranthang/Library/Mobile Documents/iCloud~md~obsidian/Documents/tommy-note-vault",
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
    mappings = {
      ["<leader>mf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true, desc = "passthrough" },
      },
      ["<leader>mc"] = {
        action = function()
          return "<cmd>ObsidianQuickSwitch<CR>"
        end,
        opts = { noremap = false, expr = true, buffer = true, desc = "quick switch" },
      },
      ["<leader>mcb"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true, desc = "toggle checkbox" },
      },
      ["<leader>mtd"] = {
        action = function()
          return "<cmd>ObsidianToday<CR>"
        end,
        opts = { buffer = true, desc = "today note" },
      },
      ["<leader>mtm"] = {
        action = function()
          return "<cmd>ObsidianTomorrow<CR>"
        end,
        opts = { buffer = true, desc = "tomorrow note" },
      },
      ["<leader>my"] = {
        action = function()
          return "<cmd>ObsidianYesterday<CR>"
        end,
        opts = { buffer = true, desc = "yesterday note" },
      },
      ["<leader>mn"] = {
        action = function()
          return "<cmd>ObsidianNew<CR>"
        end,
        opts = { buffer = true, desc = "new note" },
      },
      ["<leader>ms"] = {
        action = function()
          return "<cmd>ObsidianSearch<CR>"
        end,
        opts = { buffer = true, desc = "search" },
      },
      ["<leader>mp"] = {
        action = function()
          return "<cmd>ObsidianPasteImage<CR>"
        end,
        opts = { buffer = true, desc = "paste image" },
      },
    },
  },
}
