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

vim.keymap.set("x", "<Tab>", ">gv", {})
vim.keymap.set("x", "<S-Tab>", "<gv", {})

-- This is for delete change, replace action to be do under _ registry
vim.keymap.set({ "n" }, "r", '"_r', {})
vim.keymap.set({ "n", "v", "x" }, "d", '"_d', {})
vim.keymap.set({ "n" }, "x", '"_x', {})
vim.keymap.set({ "n" }, "c", '"_c', {})

-- This is for resizing window MacOS specific
vim.keymap.set("n", "˚", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "∆", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "˙", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "¬", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
