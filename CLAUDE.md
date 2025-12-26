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
| 139 | mauve | `#af87af` | user, symlinks, renamed |
| 243 | gray | `#767676` | group, unmodified |
| 245 | light gray | `#8a8a8a` | permissions, older dates |
| 240 | dark gray | `#585858` | no-access, ignored, tree-edge |
| 223 | peach | `#ffd7af` | hour-old dates, highlights |
| 181 | rose | `#d7afaf` | day-old dates, media |
| 180 | tan | `#d7af87` | large files, markup |
| 108 | sage | `#87af87` | executables, git new, source code |
| 179 | gold | `#d7af5f` | git modified, config, archives |
| 167 | coral | `#d75f5f` | errors, deleted, conflicts |
| 109 | teal | `#87afaf` | directories, links, tooling |

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

