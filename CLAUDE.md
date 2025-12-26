# lsd-theme

Custom "Warm Graphite" theme for terminal file listing using [lsd](https://github.com/lsd-rs/lsd) and [vivid](https://github.com/sharkdp/vivid).

## Repository Structure

```
lsd-theme/
├── lsd/
│   ├── config.yaml    # lsd settings
│   └── colors.yaml    # UI metadata colors
└── vivid/
    └── themes/
        └── warm-graphite.yml  # file type colors
```

## Installation

```bash
# Copy lsd config
cp lsd/*.yaml ~/.config/lsd/

# Copy vivid theme
mkdir -p ~/.config/vivid/themes
cp vivid/themes/warm-graphite.yml ~/.config/vivid/themes/
```

## Architecture

Two complementary systems handle different aspects of coloring:

| System | Config Location | Purpose |
|--------|-----------------|---------|
| **vivid** | `~/.config/vivid/themes/warm-graphite.yml` | File type colors via `LS_COLORS` |
| **lsd** | `~/.config/lsd/colors.yaml` | UI metadata (user, group, permissions, dates, git status) |
| **lsd** | `~/.config/lsd/config.yaml` | Layout and behavior settings |

## Color Palette (ANSI 256)

| Code | Name | Hex | Used For |
|------|------|-----|----------|
| 140 | mauve | `#af87d7` | user, symlinks, renamed (lavender) |
| 243 | gray | `#767676` | group, unmodified |
| 245 | light gray | `#8a8a8a` | permissions, older dates |
| 240 | dark gray | `#585858` | no-access, ignored, tree-edge |
| 223 | peach | `#ffd7af` | hour-old dates, highlights |
| 174 | rose | `#d78787` | day-old dates, media (salmon) |
| 186 | tan | `#d7d787` | large files, markup (chartreuse) |
| 107 | sage | `#87af5f` | executables, git new, source code (lime) |
| 178 | gold | `#d7af00` | git modified, config, archives (cleaner) |
| 173 | coral | `#d7875f` | errors, deleted, conflicts (terracotta) |
| 73 | teal | `#5fafaf` | directories, links, tooling (richer) |

## Shell Setup

In `~/.zshrc`:
```bash
export LS_COLORS="$(vivid generate warm-graphite)"
alias ls='lsd'
```

## Testing

```bash
source ~/.zshrc
lsd -la              # long listing
lsd --tree --depth 2 # tree view
lsd -la --git        # with git status
```

