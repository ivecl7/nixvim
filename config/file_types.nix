# The shortcuts for special files or special plugins
let
  markdown_keymaps = [
    # Refer: https://b23.tv/xYN8gh0 And now the repo is moved to https://github.com/theniceboy/nvim/blob/master/md-snippets.vim
    {
      mode = "i";
      key = ",f";
      action = "<Esc>/<++><CR>:nohlsearch<CR>\"_c4l";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",b";
      action = "**** <++><Esc>F*hi";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",s";
      action = "~~~~ <++><Esc>F~hi";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",i";
      action = "** <++><Esc>F*i";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",d";
      action = "`` <++><Esc>F`i";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",c";
      action = "```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",m";
      action = "- [ ] ";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",1";
      action = "#<Space><Enter><++><Esc>kA";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",2";
      action = "##<Space><Enter><++><Esc>kA";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",3";
      action = "###<Space><Enter><++><Esc>kA";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",4";
      action = "####<Space><Enter><++><Esc>kA";
      options = {
        buffer = true;
      };
    }
    # Speed coding
    {
      mode = "i";
      key = ",l";
      action = "$$ <++><Esc>F$i";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",p";
      action = "() <++><Esc>F)i";
      options = {
        buffer = true;
      };
    }
  ];
in
{
  autoGroups = {
    filetypes = { };
  };

  files."ftdetect/terraformft.lua".autoCmd = [
    {
      group = "filetypes";
      event = [
        "BufRead"
        "BufNewFile"
      ];
      pattern = [
        "*.tf"
        " *.tfvars"
        " *.hcl"
      ];
      command = "set ft=terraform";
    }
  ];

  files."ftdetect/bicepft.lua".autoCmd = [
    {
      group = "filetypes";
      event = [
        "BufRead"
        "BufNewFile"
      ];
      pattern = [
        "*.bicep"
        "*.bicepparam"
      ];
      command = "set ft=bicep";
    }
  ];

  files = {
    "after/ftplugin/markdown.lua".keymaps = markdown_keymaps;
    "after/ftplugin/rust.lua".keymaps = [
      {
        mode = "n";
        key = "r";
        action = ":make run<CR>";
      }
    ];

    # vimwiki: a plugin I sincerely recommend using
    "after/ftplugin/vimwiki.lua".autoCmd = [
      {
        group = "filetypes";
        event = [
          "BufEnter"
        ];
        command = "lua vim.diagnostic.enable(false)";
      }
      {
        group = "filetypes";
        event = [
          "InsertEnter"
        ];
        command = "lua vim.diagnostic.reset()";
      }
    ];
    "after/ftplugin/vimwiki.lua".keymaps = markdown_keymaps ++ [
      {
        mode = "n";
        key = "r";
        action = "<plug>Vimwiki2HTMLBrowse<CR>";
      }
      {
        mode = "n";
        key = "<leader>r";
        action.__raw = ''
          function()
            local current_line = vim.api.nvim_get_current_line()
            if current_line:sub(1, 1) == ':' then
              vim.cmd(current_line)
            end
          end
        '';
        options = {
          desc = "run current line with vim commands";
          silent = true;
        };
      }
      {
        # Preview:
        # {{$%align%
        # _ <- your cursor
        # }}$
        mode = "n";
        key = ",a";
        action = "O{{$%align%<Esc>jo}}$<Esc>ki";
        options = {
          desc = "generate a simple vimwiki-syntax latex block";
          silent = true;
        };
      }
      {
        # Preview:
        # {{$
        # \boxed{
        # \begin{array}{_} # _ is your cursor's position
        # Suppose there has a line code
        # <++>
        # \end{array}
        # }
        # }}$
        mode = "n";
        key = ",b";
        action = "O{{$<CR>\\boxed{<CR>\\begin{array}{}<Esc>jo<++><CR>\\end{array}<CR>}<CR>}}$<Esc>5k2f}i";
        options = {
          desc = "generate a standard vimwiki-syntax latex block";
          silent = true;
        };
      }
    ];
  };
}
