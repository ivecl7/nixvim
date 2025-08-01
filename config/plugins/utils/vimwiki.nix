{ pkgs, ... }:
let
  vimwiki = pkgs.vimUtils.buildVimPlugin {
    name = "vimwiki";
    src = pkgs.fetchFromGitHub {
      owner = "ivecl7";
      repo = "vimwiki";
      rev = "e5b75e9e5e05427bd89bec8517532ab1c53d7a23";
      hash = "sha256-ySWNHQSe1NKIywUN8wgDbwxJjdXdQBzBu+CLf2p7wOA=";
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
