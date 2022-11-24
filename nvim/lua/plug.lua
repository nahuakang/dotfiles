local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

-- Automatically run :PackerCompile whenever plugins.lua updates
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    --Editor Plugins
    use 'arcticicestudio/nord-vim';
    use 'airblade/vim-rooter';
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'}
    use 'bfrg/vim-cpp-modern';
    use 'cespare/vim-toml';
    use 'dense-analysis/ale';
    use 'elzr/vim-json';
    use 'godlygeek/tabular';
    use 'jiangmiao/auto-pairs';
    use 'jremmen/vim-ripgrep';
    use {'junegunn/fzf', dir='~/.fzf'};
    use 'junegunn/fzf.vim';
    use 'kyazdani42/nvim-web-devicons';
    use 'kyazdani42/nvim-tree.lua';
    use 'lifepillar/vim-gruvbox8';
    use 'mhinz/vim-signify';
    use 'mhinz/vim-startify';
    use 'morhetz/gruvbox';
    use 'nvim-treesitter/nvim-treesitter';
    use 'numToStr/FTerm.nvim';
    use 'plasticboy/vim-markdown';
    use 'preservim/tagbar';
    use 'puremourning/vimspector';
    use 'rking/ag.vim';
    use 'sainnhe/gruvbox-material';
    use 'tpope/vim-commentary';
    use 'tpope/vim-fugitive';
    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use 'Yggdroot/indentLine';
    use 'ggandor/leap.nvim';

    -- Language Server Related
    use 'williamboman/mason.nvim';
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig';
    use 'simrat39/rust-tools.nvim';

    -- Completion- & Snippet-Plugins
    use 'hrsh7th/nvim-cmp';
    use 'hrsh7th/cmp-nvim-lsp';
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help';
    use 'hrsh7th/cmp-vsnip';
    use 'hrsh7th/cmp-path';
    use 'hrsh7th/cmp-buffer';
    use 'hrsh7th/vim-vsnip';

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
