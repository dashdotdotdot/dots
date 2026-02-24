-- plugins/lspconfig.lua
-- Neovim >= 0.11 LSP config using vim.lsp.config / vim.lsp.enable
-- Works with Mason and LazyVim

return {
  -- Mason core
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup({ PATH = "prepend" })
    end,
  },

  -- Mason LSP integration
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = false,
        ensure_installed = {
          "fortls",
          "bashls",
          "omnisharp",
          "cmake",
          "lua_ls",
          "gopls",
          "templ",
          "html",
          "cssls",
          "emmet_ls",
          "tailwindcss",
          "ts_ls",
          "astro",
          "ols",
          "pyright",
          "clangd",
          "prismals",
          "yamlls",
          "jsonls",
          "eslint",
          "marksman",
          "sqlls",
          "wgsl_analyzer",
          "texlab",
          "intelephense",
          "nim_langserver",
        },
      })
    end,
  },

  -- LSPConfig
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")

      -- helper to register servers
      local function register(name, conf)
        conf = conf or {}
        conf.capabilities = conf.capabilities or capabilities
        vim.lsp.config(name, conf)
        vim.lsp.enable(name)
      end

      -- Servers with default configs
      local simple_servers = {
        "gopls",
        "cssls",
        "prismals",
        "yamlls",
        "jsonls",
        "eslint",
        "marksman",
        "sqlls",
        "wgsl_analyzer",
        "texlab",
        "intelephense",
        "nim_langserver",
        "pyright",
      }
      for _, s in ipairs(simple_servers) do
        register(s)
      end

      -- Servers with custom configs

      -- CMake
      register("cmake")

      -- Fortran
      register("fortls", {
        root_dir = function(fname)
          return util.root_pattern("*.f90")(fname)
        end,
      })

      -- Purescript
      register("purescriptls", {
        filetypes = { "purescript" },
        settings = { purescript = { addSpagoSources = true } },
        flags = { debounce_text_changes = 150 },
      })

      -- Odin
      register("ols", {
        root_dir = function(fname)
          return util.root_pattern("*.odin")(fname)
        end,
      })

      -- OCaml
      register("ocamllsp", {
        cmd = { "ocamllsp", "--stdio" },
        filetypes = { "ocaml", "reason" },
        root_dir = function(fname)
          return util.root_pattern("*.opam", "esy.json", "package.json")(fname)
        end,
      })

      -- Roc
      register("roc_ls", {
        cmd = { "roc_language_server", "--stdio" },
        filetypes = { "roc" },
        single_file_support = true,
      })

      -- Godot / GDScript
      register("gdscript", { filetypes = { "gd", "gdscript", "gdscript3" } })

      -- Astro, Nil/Nix
      register("astro")
      register("nil_ls")

      -- Zig
      register("zls", { cmd = { "zls" } })

      -- Haskell
      register("hls", { single_file_support = true })

      -- Bash
      register("bashls")

      -- Lua
      register("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      })

      -- Emmet
      register("emmet_ls", {
        single_file_support = true,
        filetypes = {
          "templ",
          "html",
          "css",
          "php",
          "javascript",
          "javascriptreact",
          "typescriptreact",
          "typescript",
          "jsx",
          "tsx",
        },
      })

      -- Templ
      register("templ", { filetypes = { "templ" } })

      -- TypeScript / JavaScript
      register("ts_ls", {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html" },
        root_dir = util.root_pattern("package.json", "tsconfig.json", ".git"),
        single_file_support = true,
      })

      -- Clang / C++
      register("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--pch-storage=memory",
          "--all-scopes-completion",
          "--pretty",
          "--header-insertion=never",
          "-j=4",
          "--inlay-hints",
          "--header-insertion-decorators",
          "--function-arg-placeholders",
          "--completion-style=detailed",
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = util.root_pattern("src"),
        init_options = { fallbackFlags = { "-std=c++2a" } },
        single_file_support = true,
      })

      -- OmniSharp
      register("omnisharp", { cmd = { "OmniSharp" } })

      -- Fennel
      register("fennel_ls", { cmd = { "fennel-ls" } })

      -- Rescript
      register("rescriptls", {
        cmd = { "rescript-language-server", "--stdio" },
        root_dir = util.root_pattern("rescript.json"),
      })

      -- Julia
      register("julials", {
        cmd = { "julia-lsp" },
        root_dir = util.root_pattern("*.jl"),
      })
    end,
  },
}
