{ pkgs, ... }:
let
  vimwiki = pkgs.vimUtils.buildVimPlugin {
    name = "vimwiki";
    src = pkgs.fetchFromGitHub {
      owner = "ivecl7";
      repo = "vimwiki";
      rev = "4b5c439d7143b898e9cea994c868c944fae51262";
      hash = "sha256-dgJ418ZqLFe3i71IPiSNRdmD9URUtoEsnOIBlCnftf0=";
    };
  };
in
{
  plugins.vimwiki = {
    enable = true;
    package = vimwiki;
    settings = {
      auto_header = 1;
      list = [
        {
          ext = ".md";
          path = "~/.data/";
        }
      ];
    };
  };
}
