return {
  {
    'letieu/btw.nvim',
    config = function()
      require('btw').setup()
    end,
  },
  {
    'lukas-reineke/headlines.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
    opts = {},
  },
  {
    'mistricky/codesnap.nvim',
    build = 'make',
    opts = {
      watermark = '',
    },
  },
  {
    'ThePrimeagen/harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      global_settings = {},
    },
  },
}
