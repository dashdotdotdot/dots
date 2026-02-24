return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      -- Your custom ASCII logo
      local logo = table.concat({
        "          =**#:.                                                        ",
        "      ==::::-++*+=+*#-.   .                                             ",
        "*---=++#%@%%#-::==:::=-==*%                                             ",
        "==@*#@@@@@@@@@-::-=--+==::=#%@+                                         ",
        "+**%@@@@@@@@@ =+--::=@@@@*+@---+@                      :--+=-:::::::----",
        "#%@@@@@@@@     :#*=:-*@ @@@@@@@#=%.      .=+** .-=:::::::-==-+#%%@%#+=--",
        "@@@@@@@@             +==%@@ @@@@ @@. -:=@@@@@%#.:-@@*:--:-#@@@@@###*+==-",
        "@@@@@=                 #+@@  @@@@ .            #@@%::+@=+#@@@@@@@@@%#%%%",
        "@@                      @%%. @@@@            .#---#@@@@@@@@@@@@  @@@@@@@",
        "                                             *+-@@*@:+@*@@@@            ",
        "                                             :+@+@@ -@%*:               ",
        "                                             =@@%@ %@.                  ",
        "                                              +%#  +=                   ",
      }, "\n")

      dashboard.section.header.val = vim.split(logo, "\n")

      -- Dashboard buttons
      dashboard.section.buttons.val = {
        dashboard.button("f", "  find", "<cmd> lua LazyVim.pick()()<CR>"),
        dashboard.button("n", "  new", "<cmd> ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  recent", "<cmd> lua LazyVim.pick('oldfiles')()<CR>"),
        dashboard.button("g", "  find text", "<cmd> lua LazyVim.pick('live_grep')()<CR>"),
        dashboard.button("c", "  conf", "<cmd> lua LazyVim.pick.config_files()()<CR>"),
        dashboard.button("s", "  restore", "<cmd> require('persistence').load()<CR>"),
        dashboard.button("x", "  extras", "<cmd> LazyExtras<CR>"),
        dashboard.button("l", "󰒲  lazy", "<cmd> Lazy<CR>"),
        dashboard.button("q", "  quit", "<cmd> qa<CR>"),
      }

      -- Highlight groups
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"

      -- Footer spacing
      dashboard.opts.layout[1].val = 8

      return dashboard
    end,
    config = function(_, dashboard)
      require("alpha").setup(dashboard.opts)

      -- Optional: update footer after LazyVim startup
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
          dashboard.section.footer.val = "loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
