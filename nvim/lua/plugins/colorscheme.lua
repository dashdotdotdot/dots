return {
  "shaunsingh/nord.nvim",
  priority = 1000, -- load before other plugins
  config = function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("nord")

    -- transparency
    local groups = { "Normal", "NormalFloat", "SignColumn", "EndOfBuffer" }
    for _, g in ipairs(groups) do
      vim.api.nvim_set_hl(0, g, { bg = "none" })
    end
  end,
}
