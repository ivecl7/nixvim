{
  plugins.aerial = {
    enable = true;
    autoLoad = true;
  };
  keymaps = [
    {
      key = "<leader>o";
      mode = [ "n" ];
      action = "<cmd>AerialToggle<CR>";
    }
  ];
}
