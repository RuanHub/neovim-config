return {
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
    keys = {
      { '<leader>dv', ':DiffviewOpen<CR>', desc = '[D]iff [V]iew' },
      { '<leader>dc', ':DiffviewClose<CR>', desc = '[D]iff [C]lose' },
    },
    config = function()
      require('diffview').setup {
        use_icons = true,
        enhanced_diff_hl = true,
        view = {
          merge_tool = {
            layout = 'diff3_mixed',
          },
        },
      }
    end,
  },
}
