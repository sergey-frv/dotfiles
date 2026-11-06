-- Ctrl+h/j/k/l moves between Neovim splits and the panes of the surrounding multiplexer.
-- editor/nvim.lua of vim-herdr-navigation owns the keys: inside herdr it crosses into herdr panes,
-- under tmux it calls TmuxNavigate* from vim-tmux-navigator. In herdr the keys also need the
-- vim-herdr-navigation herdr plugin and its [[keys.command]] bindings in ~/.config/herdr/config.toml.
return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  dependencies = {
    {
      "paulbkim-dev/vim-herdr-navigation",
      commit = "7873100eb47212269005c693effb2a844986b30f",
    },
  },
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
  config = function()
    -- LazyVim maps <C-h/j/k/l> to <C-w>h/j/k/l on VeryLazy and then fires User LazyVimKeymaps;
    -- the maps below are set on that event and replace LazyVim's.
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimKeymaps",
      once = true,
      callback = function()
        local plugin = require("lazy.core.config").plugins["vim-herdr-navigation"]
        dofile(plugin.dir .. "/editor/nvim.lua")
        vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { silent = true, desc = "Navigate previous" })
      end,
    })
  end,
}
