# kasumi.nvim 💮

A Neovim colorscheme written in Lua, with a muted palette of dusty pinks,
sages and greys on a near-black background.

![kasumi.nvim in Astro, CSS, Rust and Go](assets/kasumi-preview-astro-css-rust-go.webp)

## Features

- Editor, syntax, Treesitter and LSP semantic token highlights
- Plugin highlights for gitsigns, nvim-cmp, telescope,
  nvim-treesitter-context, nvim-dap, neotest, mason, kulala and vim-dadbod-ui
- The 16 terminal colors set inside Neovim, so `:terminal` matches the theme
- Matching themes for Ghostty, WezTerm, tmux and zsh, in [extras](#extras)

## Installation

With `vim.pack`, the plugin manager built into Neovim 0.12 and newer:

```lua
vim.pack.add({ 'https://github.com/ryanjayleyva/kasumi.nvim' })
vim.cmd.colorscheme('kasumi')
```

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  'ryanjayleyva/kasumi.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('kasumi')
  end,
}
```

## Options

Call `setup` before loading the colorscheme. These are the defaults:

```lua
require('kasumi').setup({
  -- Use the terminal background instead of the theme background
  transparent = false,
})
```

### Transparent background

Set `transparent = true` before loading the colorscheme.

With `vim.pack`:

```lua
vim.pack.add({ 'https://github.com/ryanjayleyva/kasumi.nvim' })
require('kasumi').setup({ transparent = true })
vim.cmd.colorscheme('kasumi')
```

With lazy.nvim:

```lua
{
  'ryanjayleyva/kasumi.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('kasumi').setup({ transparent = true })
    vim.cmd.colorscheme('kasumi')
  end,
}
```

The editor, winbar and selected tab then use your terminal's background, so
set the opacity or blur in the terminal itself. Floating windows, the
statusline and the treesitter-context bar stay opaque.

## Palette

The editor colors reuse the base colors where they can. Only the
backgrounds and the soft foreground are new.

### Base colors (ANSI 0-15)

These also set the `:terminal` colors inside Neovim. The tables below are
generated from `lua/kasumi/palette.lua` by `scripts/build-extras.lua`.

<!-- palette:start -->

| Index | Name       | Color                                     |
| ----- | ---------- | ----------------------------------------- |
| 0     | black      | ![black](assets/swatches/040406.svg)      |
| 1     | rose       | ![rose](assets/swatches/dbaeaf.svg)       |
| 2     | sage       | ![sage](assets/swatches/babca7.svg)       |
| 3     | blush      | ![blush](assets/swatches/dcb2ac.svg)      |
| 4     | aqua       | ![aqua](assets/swatches/9cbeba.svg)       |
| 5     | mauve      | ![mauve](assets/swatches/ccb6bf.svg)      |
| 6     | jade       | ![jade](assets/swatches/75a894.svg)       |
| 7     | grey       | ![grey](assets/swatches/818783.svg)       |
| 8     | charcoal   | ![charcoal](assets/swatches/1e1d24.svg)   |
| 9     | rose_light | ![rose_light](assets/swatches/d7bebd.svg) |
| 10    | cream      | ![cream](assets/swatches/dbd4c9.svg)      |
| 11    | peach      | ![peach](assets/swatches/dbbfaf.svg)      |
| 12    | mist       | ![mist](assets/swatches/b3c2c9.svg)       |
| 13    | lavender   | ![lavender](assets/swatches/cac1c7.svg)   |
| 14    | sage_light | ![sage_light](assets/swatches/b5c4b8.svg) |
| 15    | silver     | ![silver](assets/swatches/d3cdca.svg)     |

### Editor colors

| Role             | Color                                           | Variable      |
| ---------------- | ----------------------------------------------- | ------------- |
| background       | ![background](assets/swatches/181818.svg)       | ink           |
| background_panel | ![background_panel](assets/swatches/121212.svg) | ink_darker    |
| background_popup | ![background_popup](assets/swatches/1d1d1d.svg) | ink_popup     |
| subtle           | ![subtle](assets/swatches/1e1d24.svg)           | charcoal      |
| selection        | ![selection](assets/swatches/2c2c2c.svg)        | ink_selection |
| foreground       | ![foreground](assets/swatches/d3cdca.svg)       | silver        |
| foreground_soft  | ![foreground_soft](assets/swatches/969995.svg)  | ash           |
| foreground_muted | ![foreground_muted](assets/swatches/818783.svg) | grey          |
| border           | ![border](assets/swatches/1e1d24.svg)           | charcoal      |

<!-- palette:end -->

## Extras

The `extras` folder has the same colors for other tools. Each file starts with
a comment that says where to copy it and what to add to your config.

| Tool                                               | File                                                        |
| -------------------------------------------------- | ----------------------------------------------------------- |
| [Ghostty](https://ghostty.org)                     | `extras/ghostty/kasumi`                                     |
| [WezTerm](https://wezterm.org)                     | `extras/wezterm/kasumi.toml` or `extras/wezterm/kasumi.lua` |
| [tmux](https://github.com/tmux/tmux)               | `extras/tmux/kasumi.tmux`                                   |
| [eza](https://github.com/eza-community/eza) in zsh | `extras/zsh/kasumi-eza.zsh`                                 |
| zsh-syntax-highlighting and zsh-autosuggestions    | `extras/zsh/kasumi-syntax.zsh`                              |

## Contributing

The extras and the palette tables above are generated from
`lua/kasumi/palette.lua`, so edit the palette and never the generated files.
Then run this with Neovim 0.10 or newer:

```sh
nvim -l scripts/build-extras.lua
```

Add `--check` to list any generated file that is out of date without writing.

## License

Released under the [Apache License 2.0](LICENSE).
