vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable LazyVim auto format
vim.g.autoformat = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set({ "i", "n" }, "<C-c>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- taken from runtime/lua/_editor.lua
vim.keymap.set(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / clear hlsearch / diff update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

--keywordprg
vim.keymap.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- lazy
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

if vim.lsp.inlay_hint then
  vim.keymap.set("n", "<leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })
end

vim.keymap.set("n", "<leader>uT",
  function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end,
  { desc = "Toggle Treesitter Highlight" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
vim.keymap.set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- Terminal Mappings
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
vim.keymap.set("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- tabs
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

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
vim.keymap.set({ "n" }, "p", '"*p', { desc = "Paste from clipboard to the right of cursor" })
vim.keymap.set({ "n" }, "P", '"*P', { desc = "Paste from clipboard to the left of cursor" })

-- Greatest keymap ever for VsCode like copy and paste
vim.keymap.set({ "x", "v" }, "p", "\"_dP", { desc = "Paste from clipboard overwrite the selection" })

vim.keymap.set({ "n", "x", "v" }, "y", '"*y', { desc = "Yank to clipboard" })

vim.keymap.set({ "n", "v", "x" }, "r", '"_r', { desc = "Replace and send deleted char to blackhole register" })
vim.keymap.set({ "n", "v", "x" }, "d", '"_d', { desc = "Delete to blackhole register" })
vim.keymap.set({ "n", "v", "x" }, "x", '"_x', { desc = "Delete current character under cursor to blackhole register" })
vim.keymap.set({ "n", "v", "x" }, "c", '"_c', { desc = "Change option and send deleted strings to blackhole register" })

vim.keymap.set({ "n", "v", "x" }, "D", '"*d', { desc = "Cut the selection" })

vim.keymap.set({ "n" }, "dl", "0\"_d$", { desc = "Delete content of the line but keep the line exists" })
vim.keymap.set({ "n" }, "Dl", "0\"*d$", { desc = "Cut content of the line but keep the line exists" })

-- This is for resizing window MacOS specific
vim.keymap.set({ "n", "t" }, "˚", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set({ "n", "t" }, "∆", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set({ "n", "t" }, "˙", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set({ "n", "t" }, "¬", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- This is for global config for terminal mode
vim.keymap.set("t", "<C-s>", "<C-\\><C-n>", { desc = "esc outside of insert mode in terminal to navigate" })

-- This is for global selection
vim.keymap.set({ "n", "i" }, "<C-a>", function() vim.cmd("normal! ggVG") end, { desc = "Global selection" })

vim.keymap.set({ "n", "v", "x" }, "<leader>lt", "<cmd>Leet tabs<cr>", { desc = "Open question lists" })
vim.keymap.set({ "n", "v", "x" }, "<leader>lc", "<cmd>Leet console<cr>", { desc = "Open console" })
vim.keymap.set({ "n", "v", "x" }, "<leader>li", "<cmd>Leet info<cr>", { desc = "Open question info" })
vim.keymap.set({ "n", "v", "x" }, "<leader>ls", "<cmd>Leet submit<cr>", { desc = "Submit the answer" })
vim.keymap.set({ "n", "v", "x" }, "<leader>lr", "<cmd>Leet random<cr>", { desc = "Select a random question" })
vim.keymap.set({ "n", "v", "x" }, "<leader>ld", "<cmd>Leet desc<cr>", { desc = "Toggle question description" })
vim.keymap.set({ "n", "v", "x" }, "<leader>ll", "<cmd>Leet lang<cr>", { desc = "Select language question" })
vim.keymap.set({ "n", "v", "x" }, "<leader>lm", "<cmd>Leet menu<cr>", { desc = "Go to menu page" })
