-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymap configurations
vim.api.nvim_set_keymap("n", "<CR>", "O<Esc>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "jzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "kzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-y>", "<C-y>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-e>", "<C-e>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<BS>", "kdd", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "J", "gT", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", "gt", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "g*", "g*zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "g#", "g#zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gD", "gDzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "gdZZ", { noremap = true, silent = true })

vim.api.nvim_set_keymap("x", "<Tab>", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<S-Tab>", "<gv", { noremap = true, silent = true })
