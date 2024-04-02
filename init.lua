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
    require("plugins.vimdoc-ja"),
    require("plugins.coc"),
    require("plugins.nvim-autopairs"),
    require("plugins.nvim-tree"),
    require("plugins.tokyonight"),
    require("plugins.telescope"),
    require("plugins.easymotion"),
    require("plugins.diffview")
})

vim.g.mapleader = ' '

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local hop = require('hop')
vim.keymap.set('n', '<leader><leader>', hop.hint_words, {})

vim.keymap.set('n', '<C-]>', '<Plug>(coc-definition)')
vim.g.coc_global_extensions = {
    "coc-lua",
    "coc-json",
    "coc-yaml",
    "coc-kotlin",
    "coc-go",
    "coc-phpls"
}
