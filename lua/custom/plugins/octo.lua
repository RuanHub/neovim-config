return {
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    keys = { { '<leader>o', ':Octo actions<CR>', desc = '[O]cto' } },
    config = function()
      require('octo').setup()
    end,
  },
}
