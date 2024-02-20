return {
  {
    "scalameta/nvim-metals",
    dependencies = {
            "nvim-lua/plenary.nvim",
            { "j-hui/fidget.nvim", opts = {} },
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      vim.g.mapleader = ' '
      vim.g.maplocalleader = ' '

      local metals_config = require("metals").bare_config()

      metals_config.settings = {
        showImplicitArguments = true,
        testUserInterface = ""
      }

      metals_config.init_options.statusBarProvider = "on"
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      metals_config.on_attach = function(client, bufner)
        require("metals").setup_dap()
      end

      return metals_config
    end,
    config = function(self, metals_config) 
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })

      vim.keymap.set('n', '<leader>tm', require("telescope").extensions.metals.commands, {desc = "[T]elescope [M]etals"}) 
    end,
  },
}
