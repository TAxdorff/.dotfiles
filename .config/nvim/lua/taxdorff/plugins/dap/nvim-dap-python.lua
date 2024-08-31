return {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local venv = os.getenv("VIRTUAL_ENV")
        local path
        if not venv then
            -- If no virtual_env dir, use a default python
            path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            -- local path = '~/.virtualenvs/debugpy/bin/python'
        else
            path = venv .. "/bin/python"
        end
        require("dap-python").setup(path)
        require("dap-python").test_runner = 'pytest'
        vim.keymap.set('n', '<leader>dpr', function()
            require('dap-python').test_method()
        end)
    end,
}

