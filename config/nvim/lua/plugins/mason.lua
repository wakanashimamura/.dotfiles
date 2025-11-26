return {
  "mason-org/mason.nvim",
  dependencies = { "mason-org/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
  config = function()
    require("mason").setup({
      ui = {
        icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" }
      }
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "clangd",
        "cmake",
        "dockerls",
        "fish_lsp",
        "jsonls",
        "lua_ls",
        "yamlls"
      },
      automatic_enable = true
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "clang-format",
        "cmakelang",
        "hadolint",
        "luaformatter",
        "prettier",
        "shfmt",
        "shellcheck"
      }
    })

    vim.schedule(function()
      vim.lsp.config("lua_ls", {
        root_markers = {
          ".lua-format",
          ".emmyrc.json",
          ".luarc.json",
          ".luarc.jsonc",
          ".luacheckrc",
          ".stylua.toml",
          "stylua.toml",
          "selene.toml",
          "selene.yml",
          "init.lua",
          ".git"
        }
      })
    end)
  end
}
