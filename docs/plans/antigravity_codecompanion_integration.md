# Antigravity CLI Integration with CodeCompanion.nvim

## 1. Overview

This document specifies the technical design and integration plan for connecting Google Antigravity CLI (`agy`) directly to Neovim via `codecompanion.nvim`.

Google Gemini CLI (`gemini`) deprecated the individual tier in favor of the unified Antigravity suite (`agy`). This integration provides both terminal CLI access and rich ACP (Agent Client Protocol) compatibility for chat and inline editing.

## 2. Integration Architecture

The integration consists of three primary components:

1. **Native CLI Interaction (`interactions.cli`)**:
   - Executes `agy` within a Neovim terminal pane (`:CodeCompanionCLI`).
   - Supports passing initial prompts, visual code selections, and interactive chat.
   - Watches project files and triggers buffer reloading (`checktime`) whenever `agy` edits files on disk.

2. **ACP Protocol Bridge (`scripts/agy-acp`)**:
   - CodeCompanion's chat buffer (`:CodeCompanionChat`) and inline assistant (`:CodeCompanion`) speak JSON-RPC 2.0 (Agent Client Protocol v1).
   - `agy` provides an NDJSON stream interface (`--print --input-format stream-json --output-format stream-json`).
   - `scripts/agy-acp` acts as a zero-dependency Python bridge translating JSON-RPC 2.0 ACP messages into `agy` stream-json events with real-time response chunking and session management.
   - Includes robust process lifecycle controls: Linux `PR_SET_PDEATHSIG` to prevent orphaned child processes if Neovim crashes, `select`-based non-blocking I/O to handle `session/cancel` immediately, and signal/atexit handlers for clean teardown.

3. **Keymaps, Completion, and UI Integration**:
   - Connects CodeCompanion's completion provider to `blink.cmp` for slash command and context autocompletion.
   - Configures `display.chat.window.width = 0.35` so the chat buffer opens more compactly rather than taking 50% of the screen width.
   - Disables line numbers (`number = false`, `relativenumber = false`) for both `codecompanion` and `codecompanion_cli` filetypes.

## 3. Implementation Steps

1. **ACP Bridge (`scripts/agy-acp`)**:
   - Implement JSON-RPC 2.0 message loop over stdio.
   - Support `initialize`, `session/new`, `session/prompt`, and `session/cancel`.
   - Translate `agy` `text_delta` streaming events to ACP `session/update` notifications.
   - Mark executable (`chmod +x scripts/agy-acp`).

2. **CodeCompanion Plugin Configuration (`lua/plugins/aiagents.lua`)**:
   - Register custom ACP adapter `antigravity` pointing to `scripts/agy-acp`.
   - Register CLI agent `antigravity` pointing to `agy`.
   - Configure default chat and inline adapters to `antigravity`.
   - Configure CLI interaction defaults.

3. **Blink Completion Wiring (`lua/plugins/completion.lua`)**:
   - Ensure `codecompanion` source is properly configured in `per_filetype`.

4. **Keymap Setup (`lua/config/keymaps.lua`)**:
   - Register `<leader>a` which-key group ("AI / Antigravity").
   - Bind `<leader>aa` (Action Palette), `<leader>ac` (Toggle Chat), `<leader>ai` (Inline Assistant), `<leader>at` (Toggle CLI Terminal via `require("codecompanion").toggle_cli()`), `<leader>ap` (CLI Prompt).
   - Register user command `:CodeCompanionCLIToggle` and buffer-local `q` to hide CLI window in normal mode.

5. **Verification**:
   - Test `scripts/agy-acp` via simulated JSON-RPC initialization and prompt.
   - Verify Neovim loads without Lua errors and commands are registered.
