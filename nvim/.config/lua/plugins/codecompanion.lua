return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        acp = {
          gemini_cli = function()
            return require("codecompanion.adapters").extend("gemini_cli", {
              defaults = {
                auth_method = "oauth-personal", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
              },                                --,
              -- env = {
              --   GEMINI_API_KEY = "",
              -- },
            })
          end,
        },
      },
    })
  end,
}
