return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },

	config = function()
		local ls = require "luasnip";
		local s = ls.snippet;
		local t = ls.text_node;
		local i = ls.insert_node;
		local d = ls.dynamic_node;
		local sn = ls.snippet_node;

		require("luasnip.loaders.from_vscode").lazy_load();
		ls.add_snippets("perl", {
			s("test", {
				t('our @TESTS = qw/'),
				i(1),
				t('/;')
			}),
			s("dump", {
				t('warn Data::Dumper->Dump(['),
				i(1),
				t('],[qw/'),
				d(2, function(args)
						return sn(nil, {
							i(1, args[1])
						})
					end,
					{ 1 }),
				t('/]);')
			}),
		}
		)
	end
}
