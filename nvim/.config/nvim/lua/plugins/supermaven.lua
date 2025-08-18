-- plugins/supermaven.lua
return {
	"supermaven-inc/supermaven-nvim",
	event = "InsertEnter",
	dependencies = { "hrsh7th/nvim-cmp" },
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<C-y>", -- accept ghost text
				clear_suggestion = "<C-]>",
				next_suggestion = "<M-]>",
				prev_suggestion = "<M-[>",
			},
			disable_inline_completion = false, -- keep ghost text
		})

		-- 🔌 Custom cmp source for Supermaven
		local cmp = require("cmp")

		local supermaven_source = {}

		supermaven_source.new = function()
			local self = setmetatable({}, { __index = supermaven_source })
			return self
		end

		function supermaven_source:complete(_, callback)
			local suggestion = require("supermaven-nvim.api").get_suggestion()
			if suggestion and suggestion.text and suggestion.text ~= "" then
				callback({
					{
						label = suggestion.text,
						kind = cmp.lsp.CompletionItemKind.Text,
						insertText = suggestion.text,
					},
				})
			else
				callback()
			end
		end

		function supermaven_source:is_available()
			return true
		end

		cmp.register_source("supermaven", supermaven_source.new())

		-- 🔧 Add Supermaven into cmp sources
		cmp.setup({
			sources = cmp.config.sources({
				{ name = "supermaven" }, -- 👈 our custom source
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
