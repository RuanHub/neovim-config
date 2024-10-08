return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 20, -- default size of the terminal
        open_mapping = [[<c-\>]], -- default key mapping to toggle the terminal
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = '1', -- the degree by which to darken the terminal background
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = 'horizontal', -- 'horizontal', 'vertical', 'tab', or 'float'
        float_opts = {
          border = 'curved',
          width = 80,
          height = 20,
          winblend = 3,
        },
      }
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

      local Terminal = require('toggleterm.terminal').Terminal

      local lazygit = Terminal:new {
        cmd = 'lazygit',
        dir = 'git_dir',
        direction = 'float',
        float_opts = {
          border = 'double',
          height = 45,
          width = 200,
        },
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd 'startinsert!'
          vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        end,
        -- function to run on closing the terminal
        on_close = function()
          vim.cmd 'startinsert!'
        end,
      }

      function Lazygit_Toggle()
        lazygit:toggle()
      end

      vim.keymap.set('n', '<leader>lg', '<cmd>lua Lazygit_Toggle()<CR>', { noremap = true, silent = true, desc = 'Open [L]azy[G]it terminal' })
    end,
  },
}
