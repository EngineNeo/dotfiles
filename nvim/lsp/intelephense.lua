---@type vim.lsp.Config
return {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  root_markers = { ".git", "composer.json" },
  settings = {
    intelephense = {
      -- Choose your license key if you have a paid version
      -- licenceKey = "your-key-here",
      files = {
        maxSize = 5000000, -- increase if you open big vendor files
      },
      diagnostics = {
        enable = true,
      },
      environment = {
        -- Add global symbols or constants so it doesn’t warn “undefined”
        includePaths = {
          "vendor", -- let it index vendor files
        },
      },
      telemetry = {
        enable = false, -- silence telemetry
      },
      -- Define globals to silence “undefined variable” warnings
      -- e.g. common Laravel / WordPress functions
      stubs = {
        "Wordpress", "Laravel", "symfony", "blade", "GraphQL"
      },
    },
  },
}
