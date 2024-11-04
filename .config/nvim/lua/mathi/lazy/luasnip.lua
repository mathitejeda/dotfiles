return {
	"L3MON4D3/LuaSnip";

	config = function ()
		local ls = require "luasnip";
		local s = ls.snippet;
		local t = ls.text_node;
		local i = ls.insert_node;

		ls.add_snippets("perl", {
			s("test", {
				t('our @TESTS = qw/'),
				i(1),
				t('/;')
			})
		}
		)
	end
}
