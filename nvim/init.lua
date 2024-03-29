----------------------
-- Nahua's Init.Lua --
----------------------

require('opts')
require('keys')
require('plug')

-----------------
-- Mason Setup --
-----------------

require('mason').setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require('mason-lspconfig').setup()

-----------------
-- COLORSCHEME --
-----------------

-- vim.cmd [[colorscheme gruvbox-material]]
-- vim.cmd [[colorscheme nord]]
vim.cmd [[colorscheme gruvbox]]
vim.cmd([[
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
]])

-------------
-- LuaLine --
-------------

require('lualine').setup {
    options = { section_separators = '', component_separators = {left = '', right = '|'} }
}

----------------
-- TreeSitter --
----------------

require('nvim-treesitter.configs').setup {
    ensure_installed = { "json", "lua", "rust", "toml", "zig" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting=false,
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}

--------------
-- NvimTree --
--------------

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()

----------------
-- BufferLine --
----------------

require("bufferline").setup{}

------------------
-- RipGrep - RG --
------------------

vim.cmd [[cnoreabbrev rg Rg]]

---------------
-- Leap.Nvim --
---------------

require('leap').add_default_mappings()

-------------------------------
-- LSP Server Configurations --
-------------------------------

-- LSP COMPLETION PLUGIN SETUP
-- Completion Plugin Setup
local cmp = require'cmp'
cmp.setup({
    -- Enable LSP snippets
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    },
    -- Installed sources:
    sources = {
        { name = 'path' },                              -- file paths
        { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
        { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
        { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'buffer', keyword_length = 2 },        -- source current buffer
        { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
        { name = 'calc'},                               -- source for math calculation
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon ={
                nvim_lsp = 'λ',
                vsnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})

---------------
-- RUST LANG --
---------------

local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy"
            },
        },
    },
})

-----------------
-- Format on Save
-----------------

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

