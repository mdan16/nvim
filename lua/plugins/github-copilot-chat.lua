return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
        { "github/copilot.vim" },
        { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
        debug = true, -- Enable debugging
        window = {
            layout = "float",
        },
    },
    -- See Commands section for default commands if you want to lazy load on them
}
