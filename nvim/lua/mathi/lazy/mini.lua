return {
	'echasnovski/mini.nvim',
	version = false,
	config = function ()
		require('mini.ai').setup()
		require('mini.surround').setup()
		require('mini.pairs').setup()
		require('mini.trailspace').setup()
		require('mini.comment').setup()
		require('mini.indentscope').setup()
		require('mini.files').setup()
		require('mini.diff').setup()
	end
}
