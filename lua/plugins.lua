--[[ 
	Use `opts = {}` to force a plugin to be loaded.
    This is equivalent to:
    require('Comment').setup({})
]]--
return {
	'tpope/vim-sleuth',
	
	{ 
		'folke/which-key.nvim',
		event = 'VimEnter' -- Sets loading event to 'VimEnter',
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
			},]]--
			{ 'nvim-telescope/telescope-ui-select.nvim' },

			{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
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
			"L3M0N4D3/LuaSnip",
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
			require("plugin-confs/mason")
		end
	}
}