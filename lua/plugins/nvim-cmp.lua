return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
        require 'cmp'.setup({
            sources = {
                { name = 'emoji' },
                { name = 'nvim_lsp' }
            }
        })
    end,
}
