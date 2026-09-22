# Advanced Tooling Integration Plan

## Overview
Integrate testing framework (neotest), NPM dependency management (package-info), and database explorer (vim-dadbod) with blink.cmp autocompletion and centralized keymaps.

## Tasks

1. **NPM Dependency Management (`lua/plugins/editing.lua`)**:
   - Add `vuki656/package-info.nvim` lazy-loaded on `package.json`.
   - Add `<leader>p*` package keymaps to `lua/config/keymaps.lua`.

2. **Database Explorer & Completion (`lua/plugins/database.lua`, `lua/plugins/completion.lua`)**:
   - Add `tpope/vim-dadbod`, `kristijanhusak/vim-dadbod-ui`, and `kristijanhusak/vim-dadbod-completion`.
   - Integrate `dadbod` completion source in `blink.cmp` for SQL filetypes (`sql`, `mysql`, `plsql`).
   - Add `<leader>D*` database keymaps to `lua/config/keymaps.lua`.

3. **Testing Framework (`lua/plugins/testing.lua`)**:
   - Add `nvim-neotest/neotest` with adapters for Vitest, Jest, and Golang.
   - Add `<leader>t*` test runner keymaps to `lua/config/keymaps.lua`.

4. **Documentation Updates (`README.md`)**:
   - Update `README.md` to reflect testing, database, and package management tooling and keybindings.
