# Neovim Configuration Cleanup Plan

## Overview
Reorganize and streamline the Neovim configuration for better startup ordering, unified toolchains, consistent plugin specs, and corrected keymaps.

## Tasks

1. **Keymaps (`lua/config/keymaps.lua`)**:
   - Fix todo-comment navigation: change duplicate `]t` mapping to `[t` for jumping backwards.
   - Remove dead stub mappings (`<leader>bo`, `<leader>x`) and unused commented which-key groups.

2. **Dashboard & Pickers (`lua/plugins/dashboard.lua`, `lua/plugins/ui.lua`)**:
   - Replace `mini.pick` in `dashboard.lua` with `fzf-lua` (`fzf-lua.files()` and `fzf-lua.live_grep()`).
   - Remove `mini.pick` from `ui.lua` as `fzf-lua` is the primary fuzzy finder across the entire configuration.

3. **Snippets & UI Options (`lua/config/lsp.lua`, `lua/plugins/completion.lua`, `lua/config/options.lua`)**:
   - Move `opt.winborder = "rounded"` into `lua/config/options.lua`.
   - Move LuaSnip snippet extensions and loader logic from `lua/config/lsp.lua` into `lua/plugins/completion.lua` under LuaSnip's dependency spec.
   - Remove obsolete `lua/config/lsp.lua`.

4. **Bootstrap & Options (`init.lua`, `lua/config/options.lua`, `lua/config/lazy.lua`)**:
   - Move leader keys into `lua/config/options.lua`.
   - Order `init.lua` so `config.options` is required before `config.lazy`.
   - Remove duplicate option definitions from `init.lua` and `lazy.lua`.

5. **DAP Spec Consistency (`lua/plugins/dap.lua`)**:
   - Wrap DAP plugin specification in a table to align with the rest of the plugin configuration files.
