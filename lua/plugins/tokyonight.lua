return {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        -- load the colorscheme here
        require('tokyonight').setup({
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        })
        vim.cmd([[colorscheme tokyonight]])
    end,
}
