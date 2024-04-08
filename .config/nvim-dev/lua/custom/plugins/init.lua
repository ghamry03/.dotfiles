-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
        'christoomey/vim-tmux-navigator',
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<CR>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<CR>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<CR>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<CR>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<CR>" },
        },
}
