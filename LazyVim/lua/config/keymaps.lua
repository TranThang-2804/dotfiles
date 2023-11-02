-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.keymap.set("n", "j", "jzz", { desc = "Go down and center" })
vim.keymap.set("n", "k", "kzz", { desc = "Go up and center" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Go up and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Go down and center" })
vim.keymap.set("n", "<C-y>", "<C-y>zz", { desc = "Go down and center" })
vim.keymap.set("n", "<C-e>", "<C-e>zz", { desc = "Go up and center" })

vim.keymap.set("n", "<BS>", "kdd", { desc = "Delete line above" })
vim.keymap.set("n", "<CR>", "O<Esc>j", { desc = "I'm not remember what this's for" })

vim.keymap.set("n", "g*", "g*zz", {})
vim.keymap.set("n", "g#", "g#zz", {})
vim.keymap.set("n", "gD", "gDzz", {})
vim.keymap.set("n", "gd", "gdZZ", {})

vim.keymap.set("x", "<Tab>", ">gv", { remap = true })
vim.keymap.set("x", "<S-Tab>", "<gv", { remap = true })

-- This is for delete change, replace action to be do under _ registry
vim.keymap.set({ "n" }, "r", '"_r', { remap = true })
vim.keymap.set({ "n" }, "x", '"_x', { remap = true })
vim.keymap.set({ "n" }, "c", '"_c', { remap = true })
