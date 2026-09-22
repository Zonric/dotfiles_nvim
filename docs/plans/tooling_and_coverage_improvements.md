# Tooling and Coverage Improvements Plan

## Overview
Address key tooling gaps for React/TSX development, extend formatting coverage, provide diagnostic and git hunk navigation, refine file tree defaults, and prune stale dependencies.

## Tasks

1. **Context-Aware JSX Comments (`lua/plugins/editing.lua`)**:
   - Install `nvim-ts-context-commentstring` and integrate it into Neovim's `vim.filetype.get_option` function to ensure correct comment syntax (`{/* */}` vs `//`) in JSX/TSX.

2. **Extended Formatting Coverage (`lua/plugins/formatting.lua`)**:
   - Add `css`, `scss`, `html`, `yaml`, and `markdown` to `conform.nvim` with `prettierd` (falling back to `prettier`).

3. **Diagnostic Navigation (`lua/config/keymaps.lua`)**:
   - Add `]d` and `[d` keymaps for `vim.diagnostic.goto_next` and `vim.diagnostic.goto_prev`.

4. **Git Hunk Navigation & Inline Actions (`lua/plugins/git.lua`)**:
   - Configure `gitsigns.nvim` with hunk navigation (`]h`, `[h`), inline preview (`<leader>gp`), and hunk staging/reset actions (`<leader>ghs`, `<leader>ghr`).

5. **Settings Polish & File Tree Visibility (`lua/config/options.lua`, `lua/plugins/ui.lua`)**:
   - Fix header comment typo in `options.lua`.
   - Update `nvim-tree` to show dotfiles by default (`dotfiles = false`).

6. **Dependency Pruning & Documentation (`lazy-lock.json`, `README.md`)**:
   - Remove stale `mini.pick` lockfile entry.
   - Update `README.md` with new keymaps and formatting coverage.
