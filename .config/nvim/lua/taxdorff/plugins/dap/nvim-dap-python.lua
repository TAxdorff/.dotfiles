return {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        -- local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        local path = os.getenv("VIRTUAL_ENV") .. "/bin/python"
        -- local path = '~/.virtualenvs/debugpy/bin/python'
        require("dap-python").setup(path)
        require("dap-python").test_runner = 'pytest'
        vim.keymap.set('n', '<leader>dpr', function()
            require('dap-python').test_method()
        end)
    end,
}

