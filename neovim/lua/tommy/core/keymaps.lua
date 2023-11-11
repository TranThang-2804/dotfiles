vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable LazyVim auto format
vim.g.autoformat = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
-- vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Navigate
vim.keymap.set("n", "j", "jzz", { desc = "Go down and center" })
vim.keymap.set("n", "k", "kzz", { desc = "Go up and center" })

-- Navigate buffer page vertical
vim.keymap.set("n", "<C-u>", "<C-u>zz", { remap = true, desc = "Go up and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { remap = true, desc = "Go down and center" })
vim.keymap.set("n", "<C-y>", "<C-y>zz", { remap = true, desc = "Go down and center" })
vim.keymap.set("n", "<C-e>", "<C-e>zz", { remap = true, desc = "Go up and center" })

-- Navigate buffer page horizontal
vim.keymap.set("n", "<C-i>", "4zl", { remap = true, desc = "Scrol tab/buffer to the right" })
vim.keymap.set("n", "<C-e>", "4zh", { remap = true, desc = "Scrol tab/buffer to the left" })

-- Delete and Enter file above and below
vim.keymap.set("n", "<BS>", "kdd", { desc = "Delete line above" })
vim.keymap.set("n", "<CR>", "O<Esc>j", { desc = "I'm not remember what this's for" })

-- This is keymap for LSP navigate
vim.keymap.set("n", "g*", "g*zz", { remap = true, desc = "Go to the same name" })
vim.keymap.set("n", "g#", "g#zz", { remap = true, desc = "Go to the same name" })
vim.keymap.set("n", "gD", "gDzz", { remap = true, desc = "Go to Declaration" })
vim.keymap.set("n", "gd", "gdZZ", { remap = true, desc = "Go to definition" })

vim.keymap.set("x", "<Tab>", ">gv", { desc = "Tab indent selection to the right" })
vim.keymap.set("x", "<S-Tab>", "<gv", { desc = "Tab indent selection to the left" })

-- This is for delete change, replace action to be do under _ registry
vim.keymap.set({ "n" }, "p", '"*p', {})
vim.keymap.set({ "n" }, "P", '"*P', {})

vim.keymap.set({ "x", "v" }, "p", '"*p', {})
vim.keymap.set({ "x", "v" }, "P", '"*P', {})

vim.keymap.set({ "n", "x", "v" }, "y", '"*y', {})
vim.keymap.set({ "n", "x", "v" }, "Y", '"*Y', {})

-- vim.keymap.set({ "x", "v" }, "y", '"*ygv', {})
-- vim.keymap.set({ "x", "v" }, "Y", '"*Ygv', {})

vim.keymap.set({ "n", "v", "x" }, "r", '"_r', {})
vim.keymap.set({ "n", "v", "x" }, "d", '"_d', {})
vim.keymap.set({ "n", "v", "x" }, "x", '"_x', {})
vim.keymap.set({ "n", "v", "x" }, "c", '"_c', {})
vim.keymap.set({ "n", "v", "x" }, "D", '"*d', { desc = "This is used for cutting text to clipboard" })

-- This is for resizing window MacOS specific
vim.keymap.set("n", "˚", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "∆", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "˙", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "¬", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- This is for global config for terminal mode
vim.keymap.set("t", "<C-s>", "<C-\\><C-n>", { desc = "esc outside of insert mode in terminal to navigate" })

-- This is for global selection
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Global selection" })

vim.keymap.set({ "n", "i", "v", "o", "s", "x" }, "<C-c>", "<Esc>", { desc = "Esc" })
