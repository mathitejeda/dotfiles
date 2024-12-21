return {
	'echasnovski/mini.nvim',
	version = false,
	config = function ()
		require('mini.animate').setup()
		require('mini.surround').setup()
		require('mini.pairs').setup()
		require('mini.trailspace').setup()
		require('mini.comment').setup()
	end
}
