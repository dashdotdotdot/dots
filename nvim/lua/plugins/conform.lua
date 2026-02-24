return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      fish = { "fish_indent" },
    },
    formatters = {
      prettier = {
        command = "npx",
        args = { "prettier", "--stdin-filepath", "$FILENAME" },
      },
      fish_indent = {
        command = "fish_indent",
      },
    },
  },
}
