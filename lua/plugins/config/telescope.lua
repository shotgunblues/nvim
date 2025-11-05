local themes = require('telescope.themes')

require('telescope').setup({
    pickers = {
        find_files = themes.get_ivy({
            border = true,
            borderchars = {
                prompt = {"━", "━", "━", "", "━", "━", "━", "━"},
                results = {"━", "━", "━", "", "━", "━", "━", "━"},
                preview = {"━", "┃", "━", "┃", "┏", "┓", "┛", "┗"},
            },
            layout_config = {
                height = 0.45,
                prompt_position = "bottom",
            },
        }),
        oldfiles = themes.get_ivy({
            border = true,
            borderchars = {
                prompt = {"━", "━", "━", "", "━", "━", "━", "━"},
                results = {"━", "━", "━", "", "━", "━", "━", "━"},
                preview = {"━", "┃", "━", "┃", "┏", "┓", "┛", "┗"},
            },
            layout_config = {
                height = 0.45,
                prompt_position = "bottom",
            },
        }),
        buffers = themes.get_ivy({
            border = true,
            borderchars = {
                prompt = {"━", "━", "━", "", "━", "━", "━", "━"},
                results = {"━", "━", "━", "", "━", "━", "━", "━"},
                preview = {"━", "┃", "━", "┃", "┏", "┓", "┛", "┗"},
            },
            layout_config = {
                height = 0.45,
                prompt_position = "bottom",
            },
        }),
    },
})

vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
