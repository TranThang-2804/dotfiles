return {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      build = ":Copilot auth",
      opts = {
        {
          panel = {
            enabled = false,
            auto_refresh = true,
            keymap = {
              jump_prev = "<leader>ks",
              jump_next = "<leader>js",
              accept = "<CR>",
              refresh = "<leader>ar",
              open = "<leader>ap"
            },
            layout = {
              position = "right", -- | top | left | right
              ratio = 0.4
            },
          },
          suggestion = {
            enabled = false,
            auto_trigger = true,
            hide_during_completion = true,
            debounce = 75,
            keymap = {
              accept = "<Tab>",
              accept_word = false,
              accept_line = false,
              next = "<leader>ja",
              prev = "<leader>ka",
              dismiss = "<C-<CR>>",
            },
          },
          filetypes = {
            ["*"] = true,
          },
          copilot_node_command = 'node', -- Node.js version must be > 18.x
          server_opts_overrides = {},
        }
      },
    },
    {
      "zbirenbaum/copilot-cmp",
      dependencies = "copilot.lua",
      opts = {},
      config = function(_, opts)
        local copilot_cmp = require("copilot_cmp")
        copilot_cmp.setup(opts)
      end,
    }
