return {
  "RRethy/vim-illuminate",
  opts = {
    delay = 200,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { "lsp" },
    },
  },
  config = function(_, opts)
    require("illuminate").configure(opts)

    local function map(key, dir, buffer)
      vim.keymap.set("n", key, function()
        require("illuminate")["goto_" .. dir .. "_reference"](false)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    end

    map("<leader>jr", "next")
    map("<leader>kr", "prev")

    -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        map("<leader>jr", "next", buffer)
        map("<leader>kr", "prev", buffer)
      end,
    })
  end,
  keys = {
    { "<leader>jr", desc = "Next Reference" },
    { "<leader>kr", desc = "Prev Reference" },
  },
}
