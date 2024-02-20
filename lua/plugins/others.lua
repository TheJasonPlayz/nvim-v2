return {
	'tpope/vim-sleuth',
	
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',
		
			{ 'j-hui/fidget.nvim', opts = { } },
			
			{ 'folke/neodev.nvim', opts = { } },
		},
	},
	
	
	
	{ "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000, init = (function() 
		vim.cmd [[colorscheme nightfly]]
	end)},
	
	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				icons_enabled = false,
				theme = 'auto',
				component_separators = '|',
				section_separators = '',
			},
		},
	},
	
	"hiphish/rainbow-delimiters.nvim",

	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},
	
	"nvim-tree/nvim-web-devicons",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"tpope/vim-sleuth"
}
