return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        markdown = { "prettier" },
        json = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
      },
      format_on_save = {
        lsp_fallback = true,
        asycn = false,
        timeout_ms = 100,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        asycn = false,
        timeout_ms = 100,
      })
    end, { desc = "Format file or selected text" })
  end,
}
