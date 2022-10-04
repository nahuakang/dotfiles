-------------------------
-- COLORSCHEME & FONTS --
-------------------------

if vim.fn.has('termguicolors') then
  vim.opt.termguicolors = true
end

vim.opt.guifont = 'FiraCode NF:h16'

------------------------
-- INTERFACE & SEARCH --
------------------------

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

-----------------
-- VIM FOLDING --
-----------------

vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.foldmethod = 'indent'
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-----------------
-- STATUS LINE --
-----------------

vim.opt.laststatus = 3

-- Enable hidden buffers (do not need to save when switching from unsaved files)
vim.opt.hidden = true

----------
-- TABS --
----------

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

--------------------
-- LSP COMPLETION --
--------------------

vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 350)

-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

----------------
-- Vimspector --
----------------

vim.cmd([[
  set signcolumn=yes
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])

