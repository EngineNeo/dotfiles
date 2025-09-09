return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettier" },        -- JS
        javascriptreact = { "prettier" },   -- JSX
        typescript = { "prettier" },        -- TS
        typescriptreact = { "prettier" },   -- TSX
        php = { "php_cs_fixer" },           -- PHP (or use "prettier" if preferred)
      },
    })
  end,
}
