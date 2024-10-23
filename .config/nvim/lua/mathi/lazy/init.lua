return {
    {
        "nvim-lua/plenary.nvim",
    },
    'github/copilot.vim',
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
}
