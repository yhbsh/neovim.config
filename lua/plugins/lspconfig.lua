return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', config = true },
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                local builtin = require('telescope.builtin')
                map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
                map('gr', builtin.lsp_references, '[G]oto [R]eferences')
                map('gi', builtin.lsp_implementations, '[G]oto [I]mplementation')
                map('<leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')
                map('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
                map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
                map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                map('K', vim.lsp.buf.hover, 'Hover Documentation')
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            end,
        })

        vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('lsp_format_on_save', { clear = true }),
            callback = function(event)
                if event.match:match("^%w+://") then
                    return
                end
                vim.lsp.buf.format({ bufnr = event.buf, async = true })
            end,
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local config = require('lspconfig')

        config.dartls.setup { capabilities = capabilities, settings = { lineLength = 400 } }
        config.clangd.setup { capabilities = capabilities }
        config.gopls.setup { capabilities = capabilities }
        config.rust_analyzer.setup { capabilities = capabilities }
        config.lua_ls.setup { capabilities = capabilities }
        config.zls.setup { capabilities = capabilities }
        config.tsserver.setup { capabilities = capabilities }
        config.bashls.setup { capabilities = capabilities }
        config.cmake.setup { capabilities = capabilities }
    end,
}
