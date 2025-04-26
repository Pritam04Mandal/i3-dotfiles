-- Bootstrap lazy.nvim
vim.cmd("set number relativenumber")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set tabstop=2")
vim.cmd("set expandtab")
vim.cmd("set clipboard+=unnamedplus")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "catppuccin" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

local builtin = require("telescope.builtin")
local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }
_G.resize_left = function()
	vim.cmd("vertical resize -2")
end

-- Function to resize window right
_G.resize_right = function()
	vim.cmd("vertical resize +2")
end

-- Set key mappings for resizing with Ctrl + Left/Right in normal mode
vim.api.nvim_set_keymap("n", "<C-Left>", ":lua resize_left()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", ":lua resize_right()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-s>", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-c>", ":close<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", options)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", options)
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", options)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", options)
map("n", "<A-c>", "<Cmd>BufferClose<CR>", options)

vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

require("nvim-treesitter.install").compilers = { "gcc" }
-- Move line up
vim.api.nvim_set_keymap("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
-- Move line down
vim.api.nvim_set_keymap("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
-- Move selected line/block of text up
vim.api.nvim_set_keymap("x", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Move selected line/block of text down
vim.api.nvim_set_keymap("x", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- Copy line up
vim.api.nvim_set_keymap("n", "<A-S-Up>", ":t .-1<CR>==", { noremap = true, silent = true })
-- Copy line down
vim.api.nvim_set_keymap("n", "<A-S-Down>", ":t .<CR>==", { noremap = true, silent = true })
-- Copy selected lines up
vim.api.nvim_set_keymap("x", "<A-S-Up>", ":t '<-1<CR>gv=gv", { noremap = true, silent = true })
-- Copy selected lines down
vim.api.nvim_set_keymap("x", "<A-S-Down>", ":t '>+1<CR>gv=gv", { noremap = true, silent = true })

local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = { "lua", "javascript", "typescript", "vim" },
	highlight = { enable = true },
	indent = { enable = true },
})
