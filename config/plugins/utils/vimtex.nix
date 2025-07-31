{ pkgs, ... }:
let
  tex = pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-basic
      ctex
      float
      caption
      unicode-math
      mathtools
      extarrows
      ragged2e
      booktabs
      physics
      supertabular
      multirow
      ntheorem
      gbt7714
      pgfplots
      listings
      shipunov
      seqsplit
      siunitx
      threeparttable
      xltabular
      ltablex
      makecell
      diagbox
      pict2e
      algorithm2e
      ifoddpage
      relsize
      tocloft
      footmisc
      bigfoot
      psnfss
      times
      latexmk
      ;
  };
in
{
  plugins.vimtex = {
    enable = true;
    package = pkgs.vimPlugins.vimtex;
    texlivePackage = tex;
    settings = {
      compiler_method = "latexmk";
      view_method = "zathura";
      view_zathura_options = "-c /dev/null";
    };
  };
}
