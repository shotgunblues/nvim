return function()
    local mason = require('mason')
    mason.setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
    local ok, mlsp = pcall(require, 'mason-lspconfig')
    if ok then
        mlsp.setup({
            ensure_installed = {
                'gopls', 'pyright', 'yamlls',
                'dockerls', 'docker_compose_language_service',
            },
            automatic_installation = true,
            automatic_enable = true,
        })
    end
end
