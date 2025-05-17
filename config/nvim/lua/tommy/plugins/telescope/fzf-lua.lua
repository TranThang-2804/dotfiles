return {
  "ibhagwan/fzf-lua",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for icons
  },
  keys = {
    -- Buffer navigation
    { "<leader>,",       "<cmd>FzfLua buffers<cr>",                  desc = "Switch Buffer" },
    { "<leader>fb",      "<cmd>FzfLua buffers<cr>",                  desc = "Buffers" },
    { "<leader>fr",      "<cmd>FzfLua oldfiles<cr>",                 desc = "Recent" },

    -- Files
    { "<leader><space>", "<cmd>FzfLua files<cr>",                    desc = "Find Files (cwd dir)" },
    { "<leader>ff",      "<cmd>FzfLua files<cr>",                    desc = "Find files (root dir)" },

    -- Search
    { "<leader>fc",      "<cmd>FzfLua grep_cword<cr>",               desc = "Find Config File" },
    { "<leader>sg",      "<cmd>FzfLua live_grep actions.ctrl-g<cr>", desc = "Grep (root dir)" },
    { "<leader>sb",      "<cmd>FzfLua grep_curbuf<cr>",              desc = "Buffer" },
    { "<leader>sh",      "<cmd>FzfLua help_tags<cr>",                desc = "Help Pages" },
    { "<leader>sH",      "<cmd>FzfLua highlights<cr>",               desc = "Search Highlight Groups" },
    { "<leader>sk",      "<cmd>FzfLua keymaps<cr>",                  desc = "Key Maps" },
    { "<leader>sM",      "<cmd>FzfLua manpages<cr>",                 desc = "Man Pages" },
    { "<leader>sm",      "<cmd>FzfLua marks<cr>",                    desc = "Jump to Mark" },
    { "<leader>sR",      "<cmd>FzfLua resume<cr>",                   desc = "Resume" },
    { "<leader>sa",      "<cmd>FzfLua autocmds<cr>",                 desc = "Auto Commands" },
    { "<leader>sc",      "<cmd>FzfLua command_history<cr>",          desc = "Command History" },
    { "<leader>sC",      "<cmd>FzfLua commands<cr>",                 desc = "Commands" },
    { '<leader>s"',      "<cmd>FzfLua registers<cr>",                desc = "Registers" },

    -- Git
    { "<leader>gc",      "<cmd>FzfLua git_commits<cr>",              desc = "Git commits" },
    { "<leader>gs",      "<cmd>FzfLua git_status<cr>",               desc = "Git status" },

    -- Diagnostics (fzf-lua doesn't have split doc/workspace, fallback to full)
    { "<leader>sd",      "<cmd>FzfLua diagnostics_document<cr>",     desc = "Document Diagnostics" },
    { "<leader>sD",      "<cmd>FzfLua diagnostics_workspace<cr>",    desc = "Workspace Diagnostics" },

    -- Errors
    { "<leader>se",      "<cmd>FzfLua quickfix<cr>",                 desc = "Quickfix" },
    { "<leader>sE",      "<cmd>FzfLua loclist<cr>",                  desc = "Location List" },
  },
  config = function()
    local actions = require("fzf-lua").actions
    actions = {
      -- Below are the default actions, setting any value in these tables will override
      -- the defaults, to inherit from the defaults change [1] from `false` to `true`
      files = {
        true,
        -- Pickers inheriting these actions:
        --   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
        --   tags, btags, args, buffers, tabs, lines, blines
        -- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
        -- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
        -- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
        ["enter"]  = actions.file_edit_or_qf,
        ["ctrl-s"] = actions.file_split,
        ["ctrl-v"] = actions.file_vsplit,
        ["ctrl-e"] = actions.file_tabedit,
        ["ctrl-q"]  = actions.file_sel_to_qf,
        ["ctrl-Q"]  = actions.file_sel_to_ll,
      },
    }

    require("fzf-lua").setup({
      winopts = {
        height = 0.85,
        width = 0.85,
        row = 0.3,
        col = 0.5,
        preview = {
          default = "bat", -- or "builtin"
          border = "border",
          layout = "vertical",
          scrollbar = "float",
        },
        on_create = function()
          -- called once upon creation of the fzf main window
          vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
          vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = true })
          vim.keymap.set("t", "<C-o><C-o>", "<Esc>", { silent = true, remap = true, desc = "Esc" })
        end,
      },
      fzf_opts = {
        ['--layout'] = 'reverse',
        ['--info'] = 'inline',
      },
      files = {
        prompt = 'Files❯ ',
        fd_opts = "--color=never --type f --hidden --follow --exclude .git",
      },
      git = {
        status = {
          previewer = "builtin",
        },
      },
      grep = {
        rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case -g '!.git'",
      },
      keymap = {
        -- Below are the default binds, setting any value in these tables will override
        -- the defaults, to inherit from the defaults change [1] from `false` to `true`
        builtin = {
          -- neovim `:tmap` mappings for the fzf win
          -- true,        -- uncomment to inherit all the below in your custom config
          ["ctrl-Left"]  = "preview-reset",
          ["ctrl-d"]     = "preview-page-down",
          ["ctrl-u"]     = "preview-page-up",
          ["ctrl-o"]     = "hide",
          ["<M-S-down>"] = "preview-down",
          ["<M-S-up>"]   = "preview-up",
        },
        fzf = {
          -- Only valid with fzf previewers (bat/cat/git/etc)
          ["ctrl-d"] = "preview-page-down",
          ["ctrl-u"] = "preview-page-up",
        },
      },
    })
  end,
}
