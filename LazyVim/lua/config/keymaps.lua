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

vim.keymap.set("n", "g*", "g*zz", { remap = true })
vim.keymap.set("n", "g#", "g#zz", { remap = true })
vim.keymap.set("n", "gD", "gDzz", { remap = true })
vim.keymap.set("n", "gd", "gdZZ", { remap = true })

vim.keymap.set("x", "<Tab>", ">gv", { remap = true })
vim.keymap.set("x", "<S-Tab>", "<gv", { remap = true })

vim.keymap.set("n", "Y", '"*y', { remap = true })
vim.keymap.set("n", "P", '"*p', { remap = true })
