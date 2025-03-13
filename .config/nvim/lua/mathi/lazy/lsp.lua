return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
		"hrsh7th/cmp-nvim-lsp-signature-help"
	},

	config = function()
		local cmp = require('cmp')
		local cmp_lsp = require("cmp_nvim_lsp")
		local luasnip = require("luasnip")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup {
						capabilities = capabilities
					}
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup {
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								}
							}
						}
					}
				end,
			}
		})

		cmp.setup({
			preselect = cmp.PreselectMode.None,
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<CR>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({
							select = false,
						})
					else
						fallback()
					end
				end),
				["C-n"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-p>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'treesitter' },
				{ name = 'nvim_lsp_signature_help' }
			}, {
				{ name = 'buffer' },
			})
		})

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		require 'lspconfig'.perlnavigator.setup {
			cmd = { "perlnavigator" },
			settings = {
				perlnavigator = {
					perlPath = 'perl',
					includePaths = {
						'/epl/src/admin/perl',
						'/epl/src/perl/perl',
						'/epl/src/devel/perl',
						'/epl/src/adserver/tests',
						'/epl/src/admin/tests/admin',
						'/epl/src/admin/tests/api',
						'/epl/src/adserver/tests',
						'/epl/src/formatos/tests'
					},
					enableWarnings = true,
					perltidyProfile = '/epl/src/devel/scripts/perltidyrc',
					perlcriticProfile = '',
					perlcriticEnabled = true,
					perlimportsLintEnabled = true,
				}
			}
		}

	end
}
