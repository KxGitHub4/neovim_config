return {
	{
		"hrsh7th/nvim-cmp", -- 主补全插件
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP 源
			"hrsh7th/cmp-buffer", -- Buffer 源
			"hrsh7th/cmp-path", -- 文件路径补全
			"hrsh7th/cmp-cmdline", -- 命令行补全
			"L3MON4D3/LuaSnip", -- Snippet 引擎
			"saadparwaiz1/cmp_luasnip", -- LuaSnip 补全源
			"rafamadriz/friendly-snippets", -- 常用代码片段库
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "path" },
					{ name = "buffer" },
				}),
			})
		end,
	},
}
