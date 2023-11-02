-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "j", "jzz", { remap = true, desc = "Go down and center" })
vim.keymap.set("n", "k", "kzz", { remap = true, desc = "Go up and center" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { remap = true, desc = "Go up and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { remap = true, desc = "Go down and center" })
vim.keymap.set("n", "<C-y>", "<C-y>zz", { remap = true, desc = "Go down and center" })
vim.keymap.set("n", "<C-e>", "<C-e>zz", { remap = true, desc = "Go up and center" })

vim.keymap.set("n", "<BS>", "kdd", { remap = true, desc = "Delete line above" })
vim.keymap.set("n", "<CR>", "O<Esc>j", { remap = true, desc = "I'm not remember what this's for" })

vim.keymap.set("n", "J", "gT", { noremap = true, silent = true })
vim.keymap.set("n", "K", "gt", { noremap = true, silent = true })

vim.keymap.set("n", "g*", "g*zz", { noremap = true, silent = true })
vim.keymap.set("n", "g#", "g#zz", { noremap = true, silent = true })
vim.keymap.set("n", "gD", "gDzz", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "gdZZ", { noremap = true, silent = true })

vim.keymap.set("x", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("x", "<S-Tab>", "<gv", { noremap = true, silent = true })

vim.keymap.set("n", "Y", '"*y', { noremap = true, silent = true })
vim.keymap.set("n", "P", '"*p', { noremap = true, silent = true })
