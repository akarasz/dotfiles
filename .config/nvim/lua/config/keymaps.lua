-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<C-d>", "<C-o><C-d>", { desc = "Scroll down half page" })
vim.keymap.set("i", "<C-u>", "<C-o><C-u>", { desc = "Scroll up half page" })
