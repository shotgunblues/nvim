return function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local mason_lspconfig = require('mason-lspconfig')

    mason_lspconfig.setup({
        ensure_installed = {
            'gopls', 'pyright', 'yamlls',
            'dockerls', 'docker_compose_language_service',
        },
        automatic_installation = true, 
        handlers = {
            function(server_name)
                require('lspconfig')[server_name].setup({
                    capabilities = capabilities,
                })
            end,
        },
    })
end
