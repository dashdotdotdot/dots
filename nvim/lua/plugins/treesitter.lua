return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  priority = 100,
  opts = {
    ensure_installed = {
      "lua",
      "python",
      "javascript",
      "html",
      "css",
      "json",
    },
    highlight = { enable = true },
    indent = { enable = false },
  },
}
