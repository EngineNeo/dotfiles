return {
    "neovim/nvim-lspconfig",
    config = function()
        -- Global LSP configuration (applies to all servers)
        vim.lsp.config('*', {
            capabilities = vim.lsp.protocol.make_client_capabilities(),
        })

        -- TypeScript/JavaScript
        vim.lsp.config.ts_ls = {
            filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
        }
        vim.lsp.enable("ts_ls")

        -- Biome (JavaScript, TypeScript, CSS, etc.)
        vim.lsp.config.biome = {
            cmd = function()
                local util = require("lspconfig.util")
                local cmd = "biome"
                local root_dir = util.root_pattern("biome.json", "biome.jsonc")(vim.fn.getcwd())
                    or util.find_package_json_ancestor(vim.fn.getcwd())
                    or util.find_node_modules_ancestor(vim.fn.getcwd())
                    or util.find_git_ancestor(vim.fn.getcwd())
                
                local local_cmd = root_dir and root_dir .. "/node_modules/.bin/biome"
                if local_cmd and vim.fn.executable(local_cmd) == 1 then
                    cmd = local_cmd
                end
                return { cmd, "lsp-proxy" }
            end,
            filetypes = {
                "astro", "css", "graphql", "html", "javascript", "javascriptreact",
                "json", "jsonc", "svelte", "typescript", "typescript.tsx", 
                "typescriptreact", "vue",
            },
            root_markers = { "biome.json", "biome.jsonc", "package.json", "node_modules", ".git" },
        }
        vim.lsp.enable("biome")

        -- Web technologies
        vim.lsp.enable("cssls")
        vim.lsp.enable("graphql")
        vim.lsp.enable("html")
        
        -- TailwindCSS
        vim.lsp.config.tailwindcss = {
            settings = {
                tailwindCSS = {
                    experimental = {
                        classRegex = {
                            { "([\"'`][^\"'`]*.*?[\"'`])", "[\"'`]([^\"'`]*).*?[\"'`]" },
                        },
                    },
                },
            },
        }
        vim.lsp.enable("tailwindcss")

        -- Shell/Bash
        vim.lsp.enable("bashls")
        vim.lsp.enable("shfmt")
        vim.lsp.enable("shellcheck")

        -- C/C++
        vim.lsp.enable("clangd")
        vim.lsp.enable("clang-format")
        vim.lsp.enable("cpplint")

        -- Lua
        vim.lsp.config.lua_ls = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        }
        vim.lsp.enable("lua_ls")

        -- PHP
        vim.lsp.enable("intelephense")
        vim.lsp.config.phpactor = {
            filetypes = { "php", "blade" },
        }
        vim.lsp.enable("phpactor")

        -- Other
        vim.lsp.enable("typos_lsp")
    end,
}
