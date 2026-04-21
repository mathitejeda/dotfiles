return {
	{
		"nvim-lua/plenary.nvim",
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	}
}
