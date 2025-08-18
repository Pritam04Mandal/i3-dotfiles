return {
	"akinsho/flutter-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("flutter-tools").setup({
			dev_log = { enabled = true, open_cmd = "tabedit" },
			outline = { open_cmd = "30vnew" },
			decorations = {
				statusline = { device = true, app_version = true },
			},
			lsp = {
				color = { enabled = true },
				settings = { showTodos = true, completeFunctionCalls = true },
			},
		})
	end,
}
