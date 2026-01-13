-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Prevent automatic end-of-line correction
vim.opt.fixendofline = false
vim.opt.fixeol = false

-- Specify recognized file formats
vim.opt.fileformat = "unix"
vim.opt.fileformats = { "unix", "dos", "mac" }

-- Specify spellcheck languages
vim.opt.spell = true               -- Enable spellchecking
vim.opt.spelllang = { "en", "ru" } -- Set languages
