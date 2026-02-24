return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      enabled = true,
    },
  },
  keys = {
    {
      "<space>e",
      function()
        require("snacks").explorer()
      end,
      desc = "Explorer",
    },
  },
}
