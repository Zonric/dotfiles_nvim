# Zonric's Neovim Configuration

A fast, modular Neovim configuration built with Lua, tuned for Neovim v0.12+, and centered on productivity, clean architecture, and responsive tooling.

---

## Highlights

- **Fast Completion**: Powered by `blink.cmp` with Rust fuzzy matching, NerdFont/Emoji triggers, and `LuaSnip` integration.
- **Aesthetics**: Carbonfox colorscheme (`nightfox.nvim`), `lualine.nvim` with custom active formatter and LSP indicators, and `bufferline.nvim`.
- **First-Class React & TypeScript Tooling**:
  - Language servers: `ts_ls`, `tailwindcss`, `eslint`, `emmet_language_server`.
  - Inlay hints toggleable via native Neovim 0.12 API (`<leader>ch`).
  - Formatted with `prettierd` (fallback to `prettier`) through `conform.nvim`.
  - JSX auto-tagging and renaming via `nvim-ts-autotag`.
  - Context-aware JSX comments via `nvim-ts-context-commentstring`.
  - Color previews for Tailwind CSS via `nvim-highlight-colors`.
  - Custom React snippets (`rfc`, `us`, `ue`, `um`, `uc`, `ur`).
- **Unified Fuzzy Finding**: `fzf-lua` powers all file, grep, git, and LSP pickers, as well as the startup dashboard.
- **Multi-Language Debugging**: `nvim-dap` configured for C/C++ (`lldb-dap`, `gdb`), Go (`delve`), and Node/TypeScript (`js-debug-adapter`).
- **File Management**: Both `nvim-tree` (drawer) and `mini.files` (fast in-buffer navigation).

---

## Architecture & Directory Structure

```text
~/.config/nvim/
├── init.lua                   # Entry point (options -> lazy -> keymaps/autocmds/diagnostics)
├── lazy-lock.json             # Pinned plugin lockfile
├── docs/                      # Implementation plans and design specs
│   └── plans/
├── snippets/                  # Custom LuaSnip snippet definitions
│   ├── c.lua                  # Namespaced include guards, printf, loops
│   ├── typescript.lua         # Arrow functions, interfaces, types
│   └── typescriptreact.lua    # RFC component template, hooks
└── lua/
    ├── config/                # Core Neovim configuration
    │   ├── autocmd.lua        # Auto-commands (highlight yank, help layout)
    │   ├── diagnostics.lua    # Diagnostic signs and virtual text settings
    │   ├── keymaps.lua        # Global leader and navigation keymaps
    │   ├── lazy.lua           # Lazy.nvim bootstrapping & setup
    │   └── options.lua        # Options (tabstop, leaders, UI settings)
    └── plugins/               # Domain-partitioned lazy specs
        ├── codecopy.lua       # Code sharing & remote dev utilities
        ├── completion.lua     # Blink.cmp & LuaSnip configuration
        ├── dap.lua            # DAP adapters & language debug configs
        ├── dashboard.lua      # Mini.starter dashboard with fzf-lua
        ├── diagnostics.lua    # Trouble.nvim diagnostics list
        ├── editing.lua        # Surround, autopairs, autotag
        ├── formatting.lua     # Conform.nvim & Mason tool installer
        ├── git.lua            # Gitsigns, LazyGit, DiffConflicts
        ├── informational.lua  # Todo-comments, nvim-highlight-colors
        ├── leetcode.lua       # LeetCode.nvim integration
        ├── lsp.lua            # Mason, Mason-lspconfig, nvim-lspconfig
        ├── picker.lua         # Fzf-lua UI select registration
        ├── rendering.lua      # Render-markdown
        ├── syntax.lua         # Tree-sitter-manager
        ├── themes.lua         # Nightfox (Carbonfox)
        └── ui.lua             # Lualine, Bufferline, NvimTree, Mini.files
```

---

## Keybindings Reference

**Leader key**: `Space` (`<leader>`)  
**Local leader key**: `\` (`<localleader>`)

### Code & LSP (`<leader>c*`)

| Keymap | Action | Description |
|---|---|---|
| `<leader>ca` | `vim.lsp.buf.code_action` | Trigger code actions |
| `<leader>cf` | `conform.format` | Format buffer or visual selection |
| `<leader>cr` | `vim.lsp.buf.rename` | Rename symbol across workspace |
| `<leader>ce` | `vim.diagnostic.open_float` | Show floating diagnostic message |
| `<leader>ch` | `vim.lsp.inlay_hint` | Toggle LSP inlay hints (types, params) |
| `<leader>cc` | `:CodeCopy` | Copy code snippet |
| `<leader>cu` | `:CodeCopy open ui` | Open CodeCopy UI |
| `K` | `vim.lsp.buf.hover` | Show hover documentation |
| `gd` | `vim.lsp.buf.definition` | Jump to definition |
| `gD` | `vim.lsp.buf.declaration` | Jump to declaration |
| `gi` | `vim.lsp.buf.implementation` | Jump to implementation |
| `gr` | `vim.lsp.buf.references` | Show references |
| `<C-k>` (insert) | `vim.lsp.buf.signature_help` | Signature helper |

### Find & Search (`<leader>f*`, `<leader>s*`)

| Keymap | Action | Description |
|---|---|---|
| `<leader>ff` | `fzf-lua.files()` | Find files in workspace |
| `<leader>fb` | `fzf-lua.buffers()` | Search open buffers |
| `<leader>fd` | `fzf-lua.diagnostics_document()` | Document diagnostics |
| `<leader>fr` | `fzf-lua.lsp_references()` | Workspace LSP references |
| `<leader>fs` | `fzf-lua.lsp_document_symbols()` | Document symbols |
| `<leader>sf` | `fzf-lua.live_grep()` | Live grep across project |
| `<leader>sb` | `fzf-lua.lgrep_curbuf()` | Grep within current buffer |
| `<leader>sw` | `fzf-lua.grep_cword()` | Search word under cursor |
| `<leader>st` | `:TodoFzfLua` | Search TODO / FIXME comments |

### Explorers & UI

| Keymap | Action | Description |
|---|---|---|
| `<leader>\` | `NvimTree.toggle()` | Toggle file tree drawer |
| `<leader>e` | `mini.files.open()` | In-buffer directory navigation |
| `<leader>gl` | `:LazyGit` | Open floating LazyGit |
| `<C-/>` | Terminal toggle | Open/focus bottom split terminal |

### Debugging (`<leader>d*`)

| Keymap | Action | Description |
|---|---|---|
| `<leader>db` | `dap.toggle_breakpoint()` | Toggle line breakpoint |
| `<leader>dB` | `dap.set_breakpoint()` | Set conditional breakpoint |
| `<leader>dc` / `<F8>` | `dap.continue()` | Start or continue execution |
| `<F9>` / `<leader>dn` | `dap.step_over()` | Step over |
| `<F10>` / `<leader>di`| `dap.step_into()` | Step into |
| `<F11>` / `<leader>do`| `dap.step_out()` | Step out |
| `<leader>dq` | `dap.terminate()` | Terminate debug session |
| `<leader>du` | `dapui.toggle()` | Toggle DAP UI |

### Git & Hunks (`<leader>g*`)

| Keymap | Action | Description |
|---|---|---|
| `<leader>gl` | `:LazyGit` | Open floating LazyGit |
| `<leader>gp` | `gitsigns.preview_hunk()` | Preview hunk inline |
| `<leader>ghs` | `gitsigns.stage_hunk()` | Stage hunk (normal/visual) |
| `<leader>ghr` | `gitsigns.reset_hunk()` | Reset hunk (normal/visual) |
| `<leader>ghu` | `gitsigns.undo_stage_hunk()`| Undo last stage hunk |
| `<leader>gb` | `fzf-lua.git_branches()` | Switch / inspect git branches |
| `<leader>gB` | `fzf-lua.git_blame()` | Git blame picker |
| `<leader>gc` | `fzf-lua.git_commits()` | View git commit logs |
| `<leader>gd` | `fzf-lua.git_diff()` | View git diff picker |
| `<leader>gs` | `fzf-lua.git_status()` | Git status picker |

### Navigation & Diagnostics

| Keymap | Action | Description |
|---|---|---|
| `<S-h>` / `<S-l>` | BufferLineCycle | Previous / next buffer tab |
| `<C-S-h>` / `<C-S-l>` | BufferLineMove | Move buffer tab left / right |
| `<leader>bd` | `bp\|bd#` | Close current buffer |
| `]d` / `[d` | `vim.diagnostic` | Next / previous diagnostic |
| `]h` / `[h` | `gitsigns` | Next / previous git hunk |
| `]t` / `[t` | `todo-comments` | Next / previous TODO comment |
| `<C-h/j/k/l>` | Window movement | Move focus between split windows |
| `<C-A-h/j/k/l>` | Window resize | Incrementally resize splits |

---

## Toolchain Summary

| Category | Tools & Servers Managed by Mason |
|---|---|
| **LSP** | `ts_ls`, `tailwindcss`, `eslint`, `emmet_language_server`, `gopls`, `clangd`, `pyright`, `intelephense`, `laravel_ls`, `phpactor`, `lua_ls`, `bashls`, `html`, `cssls`, `twiggy_language_server` |
| **Formatters** | `prettierd`, `goimports`, `shfmt`, `blade-formatter`, `php-cs-fixer`, `tombi`, `twig-cs-fixer`, `beautysh`, `isort`, `black`, `clang-format`, `stylua` |
| **DAP** | `js-debug-adapter`, `delve` (`dlv`), `lldb-dap`, `gdb` |

---

## Installation & Requirements

### Requirements
- **Neovim**: `v0.12.0` or newer
- **Git**, **curl**, and a **C compiler** (`gcc` or `clang`) for Treesitter parsers
- **ripgrep** (`rg`) and **fd** for fast fuzzy finding
- **Node.js** and **npm** (for language servers and formatters)

### Quick Setup
```bash
git clone https://github.com/Zonric/dotfiles_nvim.git ~/.config/nvim
nvim
```
Plugins, language servers, formatters, and debug adapters will install automatically on first launch via Lazy and Mason Tool Installer.
