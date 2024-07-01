#!/bin/bash

# Update Homebrew and install Zsh
echo "Updating Homebrew..."
brew update

echo "Installing Zsh..."
brew install zsh

# Set Zsh as the default shell
echo "Changing default shell to Zsh..."
chsh -s $(which zsh)

# Install Oh My Zsh (a framework for managing your Zsh configuration)
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Zsh Autosuggestions plugin
echo "Installing Zsh Autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Add Zsh Autosuggestions plugin to .zshrc
echo "Adding Zsh Autosuggestions plugin to .zshrc..."
sed -i '' 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' ~/.zshrc

# Apply the changes in .zshrc
echo "Applying changes..."
source ~/.zshrc

echo "Zsh and Zsh Autosuggestions installation complete!"
