-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set('t', '<C-q>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make window splitting easier

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keybinds to make split navigation easier.
--  Use ALT+<hl> to switch between tabs
--  Use ALT+<t> to open a new tab
vim.keymap.set('n', '<A-h>', ':tabprevious<CR>', { desc = 'Move focus to the left tab' })
vim.keymap.set('n', '<A-l>', ':tabnext<CR>', { desc = 'Move focus to the right tab' })
vim.keymap.set('n', '<A-t>', ':tabnew<CR>', { desc = 'Open a new tab' })

-- Set tab width to 4 spaces
vim.opt.tabstop = 4 -- Width of tab character
vim.opt.softtabstop = 4 -- Fine-tunes the amount of whitespace to be added
vim.opt.shiftwidth = 4 -- Width for autoindents
vim.opt.expandtab = true -- Converts tabs to spaces

-- Open the file explorrer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Move line up and down
vim.keymap.set('x', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selected one line down', noremap = true, silent = true })
vim.keymap.set('x', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selected one line up', noremap = true, silent = true })

-- Usefull code snipets.
vim.keymap.set('v', '<leader>l', 'y<esc>oconsole.log("<c-r>0: ", <c-r>0);<esc>', { desc = '[L]og selected', silent = true })
vim.keymap.set('n', '<leader>sue', 'ouseEffect(() => {<CR>}, []);<Esc>O', { desc = '[S]nippet useEffect', silent = true })
vim.keymap.set('v', '<leader>bm', 'd<esc>Oconsole.time("Benchmark");<cr>console.timeEnd("Benchmark");<esc>P<esc>', {
  desc = '[B]ench[M]ark selected code',
  silent = true,
})

-- errorpopus
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = '[S]nippet useEffect', silent = true })
