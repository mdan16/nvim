local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("lazy").setup({
    { "neoclide/coc.nvim",     branch = "release" },
    { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {}
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.4',
        dependencies = { "nvim-lua/plenary.nvim" }
    },
})

vim.g.mapleader = ' '

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<C-]>', '<Plug>(coc-definition)')
vim.g.coc_global_extensions = {
    "coc-lua",
    "coc-json",
    "coc-yaml",
    "coc-kotlin",
    "coc-go",
}
