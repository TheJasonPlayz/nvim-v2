--[[
	Use `opts = {}` to force a plugin to be loaded.
    This is equivalent to:
    require('Comment').setup({})
]] --
return {
	'tpope/vim-sleuth',
	{
		'folke/which-key.nvim',
		-- Sets loading event to 'VimEnter'
		event = 'VimEnter',
		config = function()
			require("which-key").setup()
			require("plugin-confs.whichkey")
		end
	},

	{
		'nvim-telescope/telescope.nvim',
		event = 'VimEnter',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			--[[{
				'nvim-telescope/telescope-fzf-native.nvim',

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = 'make',

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
				  return vim.fn.executable 'make' == 1
				end,
			},]] --
			{ 'nvim-telescope/telescope-ui-select.nvim' },

			{ 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
			{ 'nvim-telescope/telescope-project.nvim',  dependencies = { 'nvim-telescope/telescope-file-browser.nvim' } }
		},
		config = function()
			require("plugin-confs.telescope")
		end
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets"
		},
		config = function()
			require("plugin-confs.cmp")
		end
	},

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim"
		},
		config = function()
			require("plugin-confs.mason")
		end
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/neodev.nvim",                   opts = {} }
		},
		config = function()
			require("plugin-confs.lspconfig")
		end
	},

	{
		'stevearc/conform.nvim',
		lazy = false,
		keys = {
			{
				'<leader>f',
				function()
					require('conform').format { async = true, lsp_fallback = true }
				end,
				mode = '',
				desc = '[F]ormat buffer',
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { 'stylua' },
			},
		},
	},

	{
		'folke/tokyonight.nvim',
		priority = 1000,
		init = function()
			-- Load the colorscheme here.
			vim.cmd.colorscheme 'tokyonight-night'
		end,
	},

	{ 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

	{ -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		opts = {
			ensure_installed = { 'lua', 'luadoc', "python", "markdown" },
			auto_install = true,
			highlight = {
				enable = true,
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { 'ruby' },
			},
			indent = { enable = true, disable = { 'ruby' } },
		},
		config = function(_, opts)
			-- Prefer git instead of curl in order to improve connectivity in some environments
			require('nvim-treesitter.install').prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require('nvim-treesitter.configs').setup(opts)
		end,
	},

	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
}
