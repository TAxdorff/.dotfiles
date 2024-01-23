return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        -- gotta load for it to work
        require("harpoon").setup({
            settings = {
                save_on_toggle = true,
            }
        })

        -- make it work with telescope ui
        local function toggle_telescope_with_harpoon(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
            .new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = require("telescope.config").values.file_previewer({}),
                sorter = require("telescope.config").values.generic_sorter({}),
            })
            :find()
        end

        -- set open menu
        vim.keymap.set("n", "<leader>ht", function()
            local harpoon = require("harpoon")
            toggle_telescope_with_harpoon(harpoon:list())
        end, { desc = "Open harpoon window" })
    end,
    keys = {
        {
            "<leader>ha",
            function()
                require("harpoon"):list():append()
            end,
            desc = "harpoon file",
        },
        {
            "<C-e>",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = "harpoon quick menu",
        },
        {
            "<leader>1",
            function()
                require("harpoon"):list():select(1)
            end,
            desc = "harpoon to file 1",
        },
        {
            "<leader>2",
            function()
                require("harpoon"):list():select(2)
            end,
            desc = "harpoon to file 2",
        },
        {
            "<leader>3",
            function()
                require("harpoon"):list():select(3)
            end,
            desc = "harpoon to file 3",
        },
        {
            "<C-S-P>",
            function()
                require("harpoon"):list():prev()
            end,
            desc = "harpoon to prev file",
        },
        {
            "<C-S-N>",
            function()
                require("harpoon"):list():next()
            end,
            desc = "harpoon to next file",
        },
    },
}
