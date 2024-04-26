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
    require("plugins.diffview"),
    require("plugins.github-copilot"),
    require("plugins.github-copilot-chat"),
    require("plugins.nvim-cmp"),
    require("plugins.nvim-lspconfig"),
    require("plugins.xcodebuild"),
    require("plugins.kotlin-vim"),
    require("plugins.toggleterm"),
})

vim.g.mapleader = ' '
vim.opt.termguicolors = true
vim.opt.winblend = 0 -- ウィンドウの不透明度
vim.opt.pumblend = 0 -- ポップアップメニューの不透明度

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local chat = require('CopilotChat')
vim.keymap.set('n', '<leader>cc', chat.toggle, {})

vim.keymap.set("n", "<leader>x", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild Actions" })


local hop = require('hop')
vim.keymap.set('n', '<leader><leader>', hop.hint_words, {})

local toggleterm = require('toggleterm')
vim.keymap.set({ 'n', 't' }, '<leader>t', toggleterm.toggle, {})

local terminal = require('toggleterm.terminal').Terminal
local lazygit = terminal:new {
    cmd = 'lazygit',
    direction = 'float',
    hidden = true,
}
vim.keymap.set('n', '<leader>g', function()
    lazygit:toggle()
end, {})

vim.keymap.set('n', '<C-]>', '<Plug>(coc-definition)')
vim.g.coc_global_extensions = {
    "coc-lua",
    "coc-json",
    "coc-yaml",
    "coc-kotlin",
    "coc-go",
    "coc-phpls"
}

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
