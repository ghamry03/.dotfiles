return {
  {
    'letieu/btw.nvim',
    config = function()
      require('btw').setup()
    end,
  },
  {
    -- 'lukas-reineke/headlines.nvim',
    -- dependencies = 'nvim-treesitter/nvim-treesitter',
    -- config = true,
    -- opts = {},
  },
  {
"iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
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
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
}
