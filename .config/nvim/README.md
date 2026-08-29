# Neovim configuration

Personal Neovim configuration based on AstroNvim v6.

## Themes

Catppuccin Mocha is the default colorscheme. Tokyo Night is retained as a
lazy-loaded experimental theme and can be enabled with:

```vim
:colorscheme tokyonight-night
```

## Maintenance

- Run `:Lazy update` to update plugins.
- Commit `lazy-lock.json` to keep plugin versions reproducible.
- Run `selene .` to lint the Lua configuration.
