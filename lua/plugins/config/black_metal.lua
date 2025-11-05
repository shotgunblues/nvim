require("black-metal").setup({
    theme = "darkthrone",
    variant = "dark",
    alt_bg = "false",
    colored_docstrings = true,
    show_eob = true,
    term_colors = true,
    toggle_variant_key = nil,

    -----DIAGNOSTICS and CODE STYLE-----
    diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
    },
    code_style = {
        comments = "italic",
        conditionals = "none",
        functions = "italic",
        keywords = "italic",
        operators = "none",
        keyword_return = "none",
        strings = "none",
        variables = "none",
    },

    -----PLUGINS-----
    plugin = {
        lualine = {
            bold = true,
            plain = false,
        },
    },
})


require("black-metal").load()
