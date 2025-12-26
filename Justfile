# lsd-theme: Warm Graphite theme for lsd and vivid

# Install theme files to ~/.config
install:
    cp lsd/*.yaml ~/.config/lsd/
    mkdir -p ~/.config/vivid/themes
    cp vivid/themes/warm-graphite.yml ~/.config/vivid/themes/
    @echo "Installed. Run 'source ~/.zshrc' to apply."

# Sync changes from ~/.config back to repo
sync:
    cp ~/.config/lsd/colors.yaml lsd/
    cp ~/.config/lsd/config.yaml lsd/
    cp ~/.config/vivid/themes/warm-graphite.yml vivid/themes/
    @echo "Synced from ~/.config to repo."

# Test the theme
test:
    @echo "=== lsd -la ==="
    lsd -la
    @echo ""
    @echo "=== lsd --tree --depth 1 ==="
    lsd --tree --depth 1
    @echo ""
    @echo "=== lsd -la --git ==="
    lsd -la --git

# Reload shell and test
reload:
    @echo "Run: source ~/.zshrc && just test"
