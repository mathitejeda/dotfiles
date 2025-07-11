return {
	-- Terminar de configurar, tengo que mover las remaps a este archivo y configurar para que suba el statusline y que su subida sea mas amena
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
		},
		keys = {
			{
				"<leader> ",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		config = function()
			require("which-key").add({
				{ "<leader>f", group = "File" },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>g", group = "Git" },
				{ "<leader>go", "<cmd>lua MiniDiff.toggle_overlay()<cr>", desc = "Git toggle overlay" },
			})
		end
	}
}
