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
- **Comprehensive Go & Templ Support**:
  - Go tooling: `gopls` configured with full semantic tokens, staticcheck, deep analysis, unimported completions, and comprehensive inlay hints.
  - Formatting with `goimports` and `templ fmt` via `conform.nvim`.
  - Templ integration: `templ` language server via Mason, `html` and `tailwindcss` LSPs attached to `.templ` files, `nvim-ts-autotag` tag pairing, `nvim-autopairs` tag newline expansion on `<CR>`, and `luasnip` HTML snippet inheritance.
  - Dedicated Treesitter indentation queries (`queries/templ/indents.scm`) seamlessly indenting HTML structures and Templ control flow.
  - Treesitter indentation wired for both `html` and `templ` files, ensuring both block (`<div>`) and non-block/inline (`<p>`, `<span>`, `<a>`) tags properly indent inward on Enter.
- **Unified Fuzzy Finding**: `fzf-lua` powers all file, grep, git, and LSP pickers, as well as the startup dashboard.
- **Multi-Language Debugging**: `nvim-dap` configured for C/C++ (`lldb-dap`, `gdb`), Go (`delve`), and Node/TypeScript (`js-debug-adapter`).
- **Testing**: `neotest` suite runner with adapters for Go (`neotest-golang`), TypeScript/JavaScript (`neotest-vitest`, `neotest-jest`), and Python (`neotest-python`).
- **File Management & Sessions**:
  - Both `nvim-tree` (with auto-close on last buffer) and `mini.files` (fast in-buffer navigation).
  - Project session manager (`<leader>q*`) with automatic dirty buffer snapshots to prevent unwritten work loss across restarts.

---

## Architecture & Directory Structure

```text
~/.config/nvim/
├── init.lua                   # Entry point (options -> lazy -> keymaps/autocmds/diagnostics)
├── lazy-lock.json             # Pinned plugin lockfile
├── docs/                      # Implementation plans and design specs
│   └── plans/
├── queries/                   # Tree-sitter query overrides and custom extensions
│   └── templ/                 # Custom HTML/Go indentation query (indents.scm)
├── snippets/                  # Custom LuaSnip snippet definitions
│   ├── c.lua                  # Namespaced include guards, printf, loops
│   ├── typescript.lua         # Arrow functions, interfaces, types
│   └── typescriptreact.lua    # RFC component template, hooks
└── lua/
    ├── config/                # Core Neovim configuration
    │   ├── autocmd.lua        # Auto-commands (yank highlight, tree auto-close, html/templ indent)
    │   ├── diagnostics.lua    # Diagnostic signs and virtual text settings
    │   ├── keymaps.lua        # Global leader and navigation keymaps
    │   ├── lazy.lua           # Lazy.nvim bootstrapping & setup
    │   └── options.lua        # Options (tabstop, leaders, UI settings)
    └── plugins/               # Domain-partitioned lazy specs
        ├── codecopy.lua       # Code sharing & remote dev utilities
        ├── completion.lua     # Blink.cmp & LuaSnip configuration
        ├── dap.lua            # DAP adapters & language debug configs
        ├── dashboard.lua      # Mini.starter dashboard with fzf-lua
        ├── database.lua       # Vim-dadbod and dadbod-ui
        ├── diagnostics.lua    # Trouble.nvim diagnostics list
        ├── editing.lua        # Surround, autopairs, autotag, package-info
        ├── formatting.lua     # Conform.nvim & Mason tool installer
        ├── git.lua            # Gitsigns, LazyGit, DiffConflicts
        ├── informational.lua  # Todo-comments, nvim-highlight-colors
        ├── leetcode.lua       # LeetCode.nvim integration
        ├── lsp.lua            # Mason, Mason-lspconfig, nvim-lspconfig
        ├── picker.lua         # Fzf-lua UI select registration
        ├── rendering.lua      # Render-markdown
        ├── syntax.lua         # Tree-sitter-manager
        ├── testing.lua        # Neotest test runner
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

### Debug & Database (`<leader>d*`)

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
| `<leader>dr` | `dapui.open()` | Open REPL |
| `<leader>ddu`| `:DBUIToggle` | Toggle database drawer |
| `<leader>ddf`| `:DBUIFindBuffer` | Find database query buffer |
| `<leader>ddr`| `:DBUIRenameBuffer` | Rename query buffer |
| `<leader>ddl`| `:DBUILastQueryInfo` | Show last query info |

### Testing (`<leader>t*`)

| Keymap | Action | Description |
|---|---|---|
| `<leader>tr` | `neotest.run.run()` | Run nearest test |
| `<leader>tf` | `neotest.run.run(file)` | Run all tests in current file |
| `<leader>td` | `neotest.run.run(dir)` | Run all tests in current directory |
| `<leader>tl` | `neotest.run.run_last()` | Run last test executed |
| `<leader>tD` | `neotest.run.run({strategy="dap"})` | Debug nearest test with DAP |
| `<leader>ts` | `neotest.summary.toggle()` | Toggle test summary tree |
| `<leader>to` | `neotest.output.open()` | Open test output panel |
| `<leader>tS` | `neotest.run.stop()` | Stop running test |

### Project Sessions (`<leader>q*`)

| Keymap | Action | Description |
|---|---|---|
| `<leader>qq` | Project session save & quit | Save native window layout + dirty buffer snapshots and quit (`qa!`) |
| `<leader>qs` | Project session save | Save native layout + shadow snapshots without exiting |
| `<leader>qr` | Project session restore | Restore window layout, files, and unwritten modified buffer contents |
| `<leader>qd` | Project session delete | Delete saved session and dirty shadow cache for project |

### NPM Packages (`<leader>p*`)

| Keymap | Action | Description |
|---|---|---|
| `<leader>pt` | `package-info.toggle()` | Toggle dependency version hints |
| `<leader>pu` | `package-info.update()` | Update package to latest version |
| `<leader>pd` | `package-info.delete()` | Delete package from dependencies |
| `<leader>pi` | `package-info.install()` | Install a new package |
| `<leader>pc` | `package-info.change_version()` | Change package version |

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
| **LSP** | `ts_ls`, `tailwindcss`, `eslint`, `emmet_language_server`, `gopls`, `templ`, `clangd`, `pyright`, `intelephense`, `laravel_ls`, `phpactor`, `lua_ls`, `bashls`, `html`, `cssls`, `twiggy_language_server` |
| **Formatters** | `prettierd`, `goimports`, `templ`, `shfmt`, `blade-formatter`, `php-cs-fixer`, `tombi`, `twig-cs-fixer`, `beautysh`, `isort`, `black`, `clang-format`, `stylua` |
| **DAP** | `js-debug-adapter`, `delve` (`dlv`), `lldb-dap`, `gdb` |

---

## Installation & Requirements

### System Requirements

#### Common Dependencies (All Profiles)
- **Neovim**: `v0.12.0` or newer
- **tree-sitter CLI**: Required by `tree-sitter-manager.nvim` to build/compile parsers
- **Build tools**: `git`, `curl`, `tar`, and a C/C++ compiler (`gcc`/`g++` or `clang` + `make`)
- **Fuzzy finding**: `ripgrep` (`rg`), `fd` (or `fd-find`), and `fzf`
- **Runtime**: `Node.js` and `npm` (for Mason language servers and formatters)

#### Profile: Server / VPS (Minimal External Tooling)
Only installs what is required for file editing, LSP syntax checking, code sharing, and tree-sitter parsers:

- **Debian / Ubuntu**:
  ```bash
  sudo apt update && sudo apt install -y \
    git curl gcc g++ make ripgrep fd-find fzf nodejs npm tree-sitter-cli

  # Ensure 'fd' is available on PATH if Debian installs it as 'fdfind':
  mkdir -p ~/.local/bin && ln -sf $(which fdfind) ~/.local/bin/fd
  ```
- **Arch Linux**:
  ```bash
  sudo pacman -S --needed \
    git curl gcc make ripgrep fd fzf nodejs npm tree-sitter-cli
  ```
- **Fedora / RHEL**:
  ```bash
  sudo dnf install -y \
    git curl gcc gcc-c++ make ripgrep fd-find fzf nodejs npm tree-sitter-cli
  ```

#### Profile: Full Workstation (Includes Debuggers & Compilers)
In addition to the server tools, includes native debugging tools for `nvim-dap` (`gdb`, `lldb`, `delve` for Go):

- **Debian / Ubuntu**:
  ```bash
  sudo apt update && sudo apt install -y \
    git curl gcc g++ clang make ripgrep fd-find fzf nodejs npm tree-sitter-cli \
    gdb lldb golang-go python3-pip python3-venv

  mkdir -p ~/.local/bin && ln -sf $(which fdfind) ~/.local/bin/fd
  ```
- **Arch Linux**:
  ```bash
  sudo pacman -S --needed \
    git curl gcc clang make ripgrep fd fzf nodejs npm tree-sitter-cli \
    gdb lldb go delve python
  ```
- **Fedora / RHEL**:
  ```bash
  sudo dnf install -y \
    git curl gcc gcc-c++ clang make ripgrep fd-find fzf nodejs npm tree-sitter-cli \
    gdb lldb golang delve python3 python3-pip
  ```

### Quick Setup
```bash
git clone https://github.com/Zonric/dotfiles_nvim.git ~/.config/nvim
nvim
```
Plugins, language servers, and formatters will install automatically on first launch via Lazy and Mason Tool Installer.


### Server / VPS Profile
For low-resource remote servers and VPS instances where you only need fast fixes, editing, and code sharing without heavy local debuggers, test runners, or database managers:

Set the environment variable or create the marker file:
```bash
# Option A: Environment variable in ~/.bashrc or ~/.zshrc
export NVIM_SERVER=1

# Option B: Per-installation marker file
touch ~/.config/nvim/.server
```
When active:
- Disables `nvim-dap`, `vim-dadbod`, `leetcode.nvim`, `neotest`, `render-markdown`, and `package-info.nvim`.
- Excludes heavy debug adapters (`js-debug-adapter`) from automated Mason downloads.
- Hides unused debug and test keymap groups from WhichKey.
- Keeps full editing power, LSP, formatting, file explorers (`nvim-tree` + `mini.files`), fuzzy finding, and `codecopy.nvim` intact.
