vim.cmd("syntax on")
vim.opt.termguicolors = true

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lazy").setup({
  spec = {
    { import = "lazyvim.plugins" },
    { import = "plugins" }, -- ✅ this line must exist
  },
})

vim.opt.laststatus = 0

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd.colorscheme("sonokai")
    vim.o.laststatus = 0
    vim.o.statusline = ""
    -- Transparency
    vim.cmd([[
hi Normal guibg=none ctermbg=none
hi NormalNC guibg=none ctermbg=none
hi EndOfBuffer guibg=none ctermbg=none
hi SignColumn guibg=none ctermbg=none
hi StatusLine guibg=none ctermbg=none
hi VertSplit guibg=none ctermbg=none
hi ColorColumn guibg=none ctermbg=none
    ]])
  end,
})
