#!/bin/sh

# Ensure base-devel and paru are installed
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

# Install base packages
paru -S --needed - < packages_base

# Change the default shell to fish for the current user
if command -v fish > /dev/null 2>&1; then
    echo "Changing the default shell to fish for the current user."
    chsh -s "$(command -v fish)"
else
    echo "Fish shell installation failed or fish not found."
fi

# Prompt the user for the installation type
echo "Is this installation for a (c)lient, (s)erver, or (n)either?"
read -r installation_type

# Install packages based on the user's response
case "$installation_type" in
    c|C)
        echo "Installing client packages..."
        paru -S --needed - < packages_client
        ;;
    s|S)
        echo "Installing server packages..."
        paru -S --needed - < packages_server
        ;;
    n|N)
        echo "Skipping client and server package installation."
        ;;
    *)
        echo "Invalid option. Skipping additional package installation."
        ;;
esac

# Merge the .config directory into ~/.config for the current user
if [ -d ".config" ]; then
    echo "Merging .config into the user's ~/.config directory."
    cp -r .config/* ~/.config/
else
    echo ".config directory not found. Skipping merge."
fi

echo "Installation complete."
