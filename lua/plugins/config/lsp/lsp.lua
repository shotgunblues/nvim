return function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- General bindings
    local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
        end
        map('n', 'gd', vim.lsp.buf.definition)
        map('n', 'gr', vim.lsp.buf.references)
        map('n', 'K', vim.lsp.buf.hover)
        map('n', '<leader>rn', vim.lsp.buf.rename)
        map('n', '<leader>ca', vim.lsp.buf.code_action)
    end

    -- Basic servers config
    local servers = { 
        'gopls', 'pyright', 'yamlls',
        'dockerls', 'docker_compose_language_service'
    }

    for _, name in ipairs(servers) do
        lspconfig[name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end
end
