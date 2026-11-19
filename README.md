# kasumi.nvim

A Neovim colorscheme written in Lua, with a muted palette of dusty pinks,
sages and greys on a near-black background.

> **WIP:** work in progress. Editor, syntax and Treesitter groups are done.
> Plugin groups cover gitsigns, nvim-cmp, telescope, nvim-treesitter-context,
> nvim-dap, neotest, mason and kulala.

## Palette

The editor colors reuse the base colors where they can. Only the
backgrounds are new.

### Base colors (ANSI 0-15)

These also set the `:terminal` colors inside Neovim.

| Index | Name       | Hex       |
| ----- | ---------- | --------- |
| 0     | black      | `#040406` |
| 1     | rose       | `#dbaeaf` |
| 2     | sage       | `#babca7` |
| 3     | blush      | `#dcb2ac` |
| 4     | aqua       | `#9cbeba` |
| 5     | mauve      | `#ccb6bf` |
| 6     | jade       | `#75a894` |
| 7     | grey       | `#818783` |
| 8     | charcoal   | `#1e1d24` |
| 9     | rose_light | `#d7bebd` |
| 10    | cream      | `#dbd4c9` |
| 11    | peach      | `#dbbfaf` |
| 12    | mist       | `#b3c2c9` |
| 13    | lavender   | `#cac1c7` |
| 14    | sage_light | `#b5c4b8` |
| 15    | silver     | `#d3cdca` |

### Editor colors

| Role             | Hex       | Base color |
| ---------------- | --------- | ---------- |
| background       | `#111015` | new        |
| background_panel | `#0d0c11` | new        |
| background_popup | `#17161c` | new        |
| cursorline       | `#1e1d24` | charcoal   |
| selection        | `#2a2931` | new        |
| foreground       | `#d3cdca` | silver     |
| foreground_muted | `#818783` | grey       |
| border           | `#1e1d24` | charcoal   |

## License

Released under the [MIT License](LICENSE).
