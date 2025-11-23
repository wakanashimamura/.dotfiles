return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      disable_filetype = {
        "TelescopePrompt",
        "vim"
      },
      check_ts = true,
    })
  end,
}
