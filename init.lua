-- My .vimrc

vim.api.nvim_command([[
  source ~/dotfiles/coc.nvim
]])

require "paq" {
  'arcticicestudio/nord-vim';
  'airblade/vim-rooter';
  'dense-analysis/ale';
  'godlygeek/tabular';
  'jiangmiao/auto-pairs';
  'jremmen/vim-ripgrep';
  {'junegunn/fzf', dir='~/.fzf'};
  'junegunn/fzf.vim';
  'mileszs/ack.vim';
  'mhinz/vim-signify';
  'mhinz/vim-startify';
  'nvim-treesitter/nvim-treesitter';
  'lifepillar/vim-gruvbox8';
  'preservim/nerdtree';
  'preservim/tagbar';
  'rking/ag.vim';
  'tpope/vim-commentary';
  'tpope/vim-fugitive';
  'vim-airline/vim-airline';
  'Yggdroot/indentLine';
  {'neoclide/coc.nvim', branch='release'};
  'bfrg/vim-cpp-modern';
  'cespare/vim-toml';
  'elzr/vim-json';
  'plasticboy/vim-markdown';
  'python-mode/python-mode';
  'ziglang/zig.vim';
}

-- [[Fix backspace indent whenever needed]]
-- [[set backspace=indent,eol,start]]

-- COLORSCHEME & FONTS
if vim.fn.has('termguicolors') then
  vim.opt.termguicolors = true
end

vim.cmd [[colorscheme nord]]
vim.opt.guifont = 'FiraCode NF:h16'
vim.cmd([[
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
]])

-- INTERFACE & SEARCH
vim.opt.background = 'dark'
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.cursorline = true
vim.opt.wildmenu = true
vim.opt.lazyredraw = true
vim.opt.incsearch = true
vim.opt.hlsearch = true -- Highlight search matches
vim.opt.splitbelow = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true

-- VIM FOLDING
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.foldmethod = 'indent'

-- STATUS LINE
vim.opt.laststatus = 3

-- TABS
if vim.fn.has('vim_starting') then
  vim.opt.expandtab = true
  vim.opt.tabstop = 4
  vim.opt.shiftwidth = 4
  vim.opt.softtabstop = 4
  vim.opt.wrap = true
  vim.opt.linebreak = true
  -- vim-signify default updatetime 4000ms is not good for async update
  vim.opt.updatetime = 100
end

vim.cmd [[cnoreabbrev rg Rg]]

--[[
CUSTOM MAPLEADER SHORTCUTS
]]

vim.g.mapleader = ","
vim.keymap.set('n', '<Leader>ev', ':vsp $MYVIMRC<CR>')    -- Vertically split and open $MYVIMRC
vim.keymap.set('n', '<Leader>vsp', ':vsp ~/.zshrc<CR>')   -- Source .zshrc
vim.keymap.set('n', '<Leader>sv', ':source $MYVIMRC<CR>') -- Source $MYVIMRC
vim.keymap.set('n', '<Leader>s', ':mksession<CR>')        -- Saving current session
vim.keymap.set('n', '<Leader>ne', ':NERDTreeToggle<CR>')  -- Toggle NERDTree
vim.keymap.set('n', '<Leader>c', ':noh<CR>')              -- Clear search highlighting

-- Enable hidden buffers (do not need to save when switching from unsaved files)
vim.opt.hidden = true

vim.g.mapleader = " "                                     -- Set MAPLEADER to <Space>
vim.keymap.set('n', '<Leader><Space>', ':Files<CR>')      -- Open files searcher
vim.keymap.set('n', '<Leader>vs', ':vsplit<CR>')          -- Split screen vertically
vim.keymap.set('n', '<Leader>hs', ':split<CR>')           -- Split screen horizontally
vim.keymap.set('n', '<Leader>t', ':tabnew<CR>')           -- Open new tab

-- EDITOR MAPPINGS
-- move vertically by visual line
vim.keymap.set('v', 'j', 'gj')
vim.keymap.set('v', 'k', 'gk')

-- move to beginning/end of line
vim.keymap.set('n', 'B', '^')
vim.keymap.set('n', 'E', '$')
-- Open NERDTree with Ctrl + t
vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>')
-- Toggle to next and previous buffers
vim.keymap.set('n', '<C-n>', ':bnext<CR>')
vim.keymap.set('n', '<C-p>', ':bprevious<CR>')
-- Toggle between tabs
vim.keymap.set('n', '<C-j>', ':tabprevious<CR>')
vim.keymap.set('n', '<C-k>', ':tabnext<CR>')
-- Open up tagbar with Fn + F8 key
vim.keymap.set('n', 'F8', ':TagbarToggle<CR>')
-- <Space> to open/close folds
vim.keymap.set('n', '<Space>', 'za')
-- Escape from insert mode
vim.keymap.set('i', 'jk', '<Esc>')

-- TERMINAL COMMANDS
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.api.nvim_create_user_command('Vterm', ':vsp term://zsh', {})
vim.api.nvim_create_user_command('Hterm', ':sp term://zsh', {})

