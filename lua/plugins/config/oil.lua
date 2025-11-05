require('oil').setup({
    default_file_explorer = true,
    columns = {
        "icon",
    },

    keymaps = {
        ['<C-p>'] = {
            callback = function()
                local oil = require 'oil'
                oil.open_preview { vertical = true, split = 'botright' }
            end,
        },
    },
    vim.keymap.set("n", "_", function()
        local oil = require('oil')
        vim.cmd("below")
        oil.toggle_float()
        
        vim.defer_fn(function()
        local buf = vim.api.nvim_get_current_buf()
        local file = vim.api.nvim_buf_get_option(buf, 'filetype')

            if file == 'oil' then
                oil.open_preview()
            end
        end, 200)
    end, { desc = "Open Oil in floating mode with active preview" }),

    -- Configuration for the floating window in oil.open_float
    float = {
        padding = 2.5,
        max_width = 1.0,
        max_height = 0.43,
        border = "bold",
        win_options = {
            winblend = 0,
        },
        get_win_title = nil,
        preview_split = "right",
        override = function(conf)
            local title = vim.fn.fnamemodify(vim.fn.getcwd(), ":.")
            conf.title = title
            conf.title_pos = "center"

            local ui = vim.api.nvim_list_uis()[1]
            conf.row = ui.height - conf.height
            conf.col = 0
            conf.width = ui.width
            return conf
        end,
    },

    -- Configuration for the file preview window
    preview_win = {
        show_preview_on_select = true,
        update_on_cursor_moved = true,
        preview_method = "fast_scratch",
        disable_preview = function(filename)
            return false
        end,
        win_options = { wrap = true },
    },
})
