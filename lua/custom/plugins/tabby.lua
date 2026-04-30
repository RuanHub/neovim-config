return {
  {
    'nanozuki/tabby.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local devicons = require 'nvim-web-devicons'

      local function get_tab_name(tab, is_current)
        if vim.t[tab.id].tab_name then
          return vim.t[tab.id].tab_name
        end

        local win = tab.current_win()
        local buf = win.buf()
        local name = buf.name()

        if name == '' then
          return '[No Name]'
        end

        local filename = vim.fn.fnamemodify(name, ':t')
        local ext = vim.fn.fnamemodify(name, ':e')

        local icon, icon_hl = devicons.get_icon(filename, ext, { default = true })

        local hl = is_current and 'TabLineSel' or icon_hl

        return {
          { icon .. ' ', hl = hl },
          filename,
        }
      end

      require('tabby').setup {
        line = function(line)
          return {
            {
              { '  ', hl = 'TabLineSel' },
              line.sep('', 'TabLineSel', 'TabLineFill'),
            },

            line.tabs().foreach(function(tab)
              local hl = tab.is_current() and 'TabLineSel' or 'TabLine'

              return {
                line.sep('', hl, 'TabLineFill'),
                tab.number(),
                ' ',
                get_tab_name(tab, tab.is_current()),
                ' ',
                line.sep('', hl, 'TabLineFill'),
                hl = hl,
              }
            end),

            line.spacer(),
          }
        end,
      }

      -- Rename tab (your workflow)
      vim.keymap.set('n', '<leader>tr', function()
        local name = vim.fn.input 'Tab name: '
        if name ~= '' then
          vim.t.tab_name = name
        end
      end, { desc = '[T]ab [R]ename' })
    end,
  },
}
