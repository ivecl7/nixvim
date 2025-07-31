{
  plugins.flash = {
    enable = true;
    luaConfig.post = ''
      vim.keymap.set({"n", "o", "x"}, "s", function() require("flash").jump() end)
      vim.keymap.set({"n", "o", "x"}, "S", function() require("flash").treesitter() end)
      vim.keymap.set({"o"}, "r", function() require("flash").remote() end)
      vim.keymap.set({"o", "x"}, "R", function() require("flash").treesitter_search() end)
    '';
  };
}
