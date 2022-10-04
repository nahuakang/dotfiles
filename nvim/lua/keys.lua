--------------------------------
-- CUSTOM MAPLEADER SHORTCUTS --
--------------------------------

vim.g.mapleader = ","
vim.keymap.set('n', '<Leader>ev', ':vsp $MYVIMRC<CR>')    -- Vertically split and open $MYVIMRC
vim.keymap.set('n', '<Leader>vsp', ':vsp ~/.zshrc<CR>')   -- Source .zshrc
vim.keymap.set('n', '<Leader>sv', ':source $MYVIMRC<CR>') -- Source $MYVIMRC
vim.keymap.set('n', '<Leader>s', ':mksession<CR>')        -- Saving current session
vim.keymap.set('n', '<Leader>nt', ':NvimTreeToggle<CR>')  -- Toggle NvimTree
vim.keymap.set('n', '<Leader>c', ':noh<CR>')              -- Clear search highlighting

vim.g.mapleader = " "                                     -- Set MAPLEADER to <Space>
vim.keymap.set('n', '<Leader><Space>', ':Files<CR>')      -- Open files searcher
vim.keymap.set('n', '<Leader>vs', ':vsplit<CR>')          -- Split screen vertically
vim.keymap.set('n', '<Leader>hs', ':split<CR>')           -- Split screen horizontally
vim.keymap.set('n', '<Leader>t', ':tabnew<CR>')           -- Open new tab
vim.keymap.set('n', '<Leader>rn', 'vim.lsp.buf.rename()') -- Rename

-- EDITOR MAPPINGS
-- move vertically by visual line
vim.keymap.set('v', 'j', 'gj')
vim.keymap.set('v', 'k', 'gk')

-- move to beginning/end of line
vim.keymap.set('n', 'B', '^')
vim.keymap.set('n', 'E', '$')
-- Toggle to next and previous buffers
vim.keymap.set('n', '<C-n>', ':bnext<CR>')
vim.keymap.set('n', '<C-p>', ':bprevious<CR>')
-- Toggle between tabs
-- USE gt and gT instead
-- vim.keymap.set('n', '<C-j>', ':tabprevious<CR>')
-- vim.keymap.set('n', '<C-k>', ':tabnext<CR>')
-- Open up tagbar with Fn + F8 key
vim.keymap.set('n', 'F8', ':TagbarToggle<CR>')
-- <Space> to open/close folds
vim.keymap.set('n', '<Space>', 'za')
-- Escape from insert mode
vim.keymap.set('i', 'jk', '<Esc>')

-- LSP Navigation & Code Actions
-- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
vim.keymap.set('n', '<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

-- TERMINAL COMMANDS
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.api.nvim_create_user_command('Vterm', ':vsp term://zsh', {})
vim.api.nvim_create_user_command('Hterm', ':sp term://zsh', {})

-- FTerm Settings
vim.keymap.set('n', '<C-e>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-e>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

