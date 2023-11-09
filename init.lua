--++++++++++++VIM SETUP+++++++++++++++--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,})end
vim.opt.rtp:prepend(lazypath)
--==================================Plugins====================================================
local plugins = {{'nvim-telescope/telescope.nvim', tag = '1.1.4', dependencies={'nvim-lua/plenary.nvim'}},'nvim-treesitter/nvim-treesitter',
--===== LSP--Zero ========--
{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
{'neovim/nvim-lspconfig'},
{'hrsh7th/cmp-nvim-lsp'},
{'hrsh7th/nvim-cmp'},
{'L3MON4D3/LuaSnip'},
}
local opts={}
require("lazy").setup(plugins,opts)
--+
--+
--+
--+
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)  lsp_zero.default_keymaps({buffer = bufnr})
end)
lsp_zero.setup_servers({ 'tsserver'})
-- ======================TreeSitter Config================
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"javascript","typescript","html", "c", "lua", "vim", "vimdoc", "query" },
  sync_install = false, auto_install = true, highlight = { enable = true },}
--+
--+
--+
--+
-- =================================Re-Map=============================================== --
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>a", vim.cmd.Ex)
vim.keymap.set("n", "<leader>qt", [[:wq! <CR>]])
vim.keymap.set("n", "<leader>sq", [[:w<Bar> :Ex <CR>]])
vim.keymap.set("n", "<leader>s", [[:w <CR>]])
vim.keymap.set("n", "<leader>sa", [[:wa <CR>]])
--+
--+
--+
--+
-- =============Telescope ShortCuts==============
vim.keymap.set("n", "<leader>ff", [[:Telescope find_files <CR>]])
vim.keymap.set("n", "<leader>fg", [[:Telescope git_files <CR>]])
--+
--+
--+
--+
-- =================================Vim Config=============================================== --
vim.cmd('set relativenumber')
