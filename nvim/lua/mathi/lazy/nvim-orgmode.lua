return {
	'nvim-orgmode/orgmode',
	dependencies = { 'akinsho/org-bullets.nvim', },
	event = 'VeryLazy',
	ft = { 'org' },
	config = function()
		require('orgmode').setup({
			org_agenda_files = '~/orgfiles/**/*',
			org_default_notes_file = '~/notes/index.org',
			org_todo_keywords = { 'TODO(t)', 'CURSO(e)', 'COMMIT(c)', 'REV(r)', 'PROD(p)', 'BLOCKED(b)', '|', 'DONE(d)' },
		})
		require('org-bullets').setup()
	end,
}
