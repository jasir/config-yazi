# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
This is a Yazi configuration directory. Yazi is a terminal file manager written in Rust. This configuration includes custom keymaps, plugins, and visual enhancements to extend Yazi's functionality.

## File Structure
- `yazi.toml` - Main Yazi configuration (preview settings, file manager behavior)
- `keymap.toml` - Custom key bindings and shortcuts 
- `package.toml` - Plugin dependencies and version management
- `init.lua` - Lua initialization script for plugin setup and status bar customizations
- `plugins/` - Directory containing installed Yazi plugins

## Key Plugins and Functionality

### Essential Plugins
- **fr.yazi** - Content search using ripgrep with fzf and bat preview (`<F3>`)
- **smart-enter** - Intelligent enter behavior for files/directories (`l`, `<Enter>`)
- **bookmarks** - Vi-like bookmark system (`bs` to save, `B` to jump, `bd` to delete)
- **lazygit** - Git interface integration (`gi`)
- **vcs-files** - Git file status viewer (`gc`)
- **copy-file-contents** - Copy file contents to clipboard (`cF`)
- **path-from-root** - Copy path from git root (`cr`)
- **chmod** - File permission management (`cm`)

### Custom Keybindings
- `F` - Global file search using fd+fzf with bat preview
- `!` - Open shell in current directory
- `gr` - Navigate to git repository root
- `<Backspace>` - Go up one level
- `<Alt-Left>/<Alt-Right>` - Navigate back/forward in history
- `<F3>` - Search file contents with ripgrep

## Plugin Management
Plugins are managed through `package.toml` with specific revisions and hashes. To update plugins:
```bash
ya pkg update
```

To add new plugins:
```bash
ya pkg add <plugin-repo>
```

## Configuration Files
- **yazi.toml**: Preview settings, file associations, and plugin configurations
- **keymap.toml**: All custom key bindings and plugin integrations  
- **init.lua**: Lua setup for plugins and UI customizations like status bar extensions
- **package.toml**: Plugin dependency management with version pinning

## Dependencies
External tools required for full functionality:
- `bat` - Syntax highlighting for file previews
- `fzf` - Fuzzy finder for search functionality  
- `fd` - Fast file finder
- `ripgrep` (rg) - Content search
- `eza` - Modern ls replacement for directory previews
- `lazygit` - Git interface

## Status Bar Customizations
The init.lua includes custom status bar elements:
- Symlink target display
- File owner/group information (Unix systems)
- Full border UI with rounded corners

## Default Configuration Sources
Yazi's default configurations are not stored locally but are embedded in the binary. The source files can be found on GitHub:

### Default Keymap
- **Location**: https://github.com/sxyazi/yazi/blob/shipped/yazi-config/preset/keymap-default.toml
- **All presets**: https://github.com/sxyazi/yazi/tree/shipped/yazi-config/preset/
  - `keymap-default.toml` - Default keyboard shortcuts
  - `yazi-default.toml` - Default application settings
  - `theme-default.toml` - Default theme configuration

### Viewing Complete Keymap
- **In Yazi**: Press `F1` or `~` to open help menu with all keybindings
- **Filter keys**: Type in help menu to filter specific shortcuts
- **Exit help**: Press `Esc` to close help or clear filter
- **Documentation**: https://yazi-rs.github.io/docs/configuration/keymap/

Note: Yazi uses the "shipped" branch for distributed default configurations that are part of the released version.

## Local Default Configuration Files
Default configuration files have been downloaded to this directory for reference:
- `keymap-default.toml` - Complete default keyboard shortcuts
- `yazi-default.toml` - Default application settings
- `theme-dark.toml` - Default dark theme configuration
- `theme-light.toml` - Default light theme configuration

These files can be used for:
- Comparing current settings with defaults
- Restoring default behavior for specific features
- Understanding all available configuration options
- Creating new custom configurations based on defaults