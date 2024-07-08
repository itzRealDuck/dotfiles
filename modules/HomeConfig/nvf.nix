{pkgs, ...}: {
  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix

    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
        formatOnSave = true;
        nvimCodeActionMenu.enable = true;
        lsplines.enable = true;
        lightbulb.enable = true;
        trouble.enable = true;
      };
      vim.filetree = {
        nvimTree = {
          enable = true;
        };
      };
      vim.terminal = {
        toggleterm = {
          enable = true;
          lazygit.enable = true;
        };
      };
      vim.ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        modes-nvim.enable = false; # the theme looks terrible with catppuccin
        illuminate.enable = true;
        breadcrumbs = {
          enable = true;
          navbuddy.enable = true;
        };
      };
      vim.colourTerm = true;
      vim.languages = {
        enableLSP = true;
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        rust = {
          enable = true;
          crates.enable = true;
        };
        nix = {
          enable = true;
        };
        clang = {
          enable = true;
          lsp.server = "clangd";
        };
      };
      vim.statusline = {
        lualine = {
          enable = true;
          theme = "catppuccin";
        };
      };
      vim.autocomplete = {
        enable = true;
        type = "nvim-cmp";
      };
      vim.telescope.enable = true;
      vim.presence = {
        neocord.enable = true;
      };
      vim.utility = {
        vim-wakatime.enable = true;
      };
      vim.visuals = {
        enable = true;
        nvimWebDevicons.enable = true;
        scrollBar.enable = true;
        smoothScroll.enable = true;
        cellularAutomaton.enable = false;
        fidget-nvim.enable = true;
        highlight-undo.enable = true;
        indentBlankline = {
          enable = true;
          fillChar = null;
          eolChar = null;
          scope = {
            enabled = true;
          };
        };
        cursorline = {
          enable = true;
          lineTimeout = 0;
        };
      };

      vim.enableEditorconfig = true;
      vim.theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = false;
      };
      vim.assistant.copilot.enable = true;
      vim.extraPlugins = with pkgs; {
      };
    };
  };
}
