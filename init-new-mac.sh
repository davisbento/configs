#!/bin/bash

# This Script will setup a new macOS with:
# 1. install ZSH and zsh-autosuggestions and set the theme agnoster
# 2. asdf and install with Golang, pnpm, nodejs, yarn
# 3. GH CLI
# 4. install the hack nerd font

# Exit on error
set -e

# Install Homebrew if not already installed
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Zsh and make it default shell
echo "Installing Zsh..."
brew install zsh
chsh -s $(which zsh)

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
brew install zsh-autosuggestions

# Add zsh-autosuggestions to .zshrc if not already present
if ! grep -q "zsh-autosuggestions" ~/.zshrc; then
  echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >>~/.zshrc
fi

# Set Zsh theme to agnoster
echo "Setting Zsh theme to agnoster..."
sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' ~/.zshrc

# Install asdf
if ! command -v asdf &>/dev/null; then
  echo "Installing asdf..."
  brew install asdf
  echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >>~/.zshrc
fi

# Source .zshrc to load asdf
source ~/.zshrc

# Install asdf plugins and language versions
echo "Installing asdf plugins and languages..."
asdf plugin add golang || echo "Golang plugin already installed"
asdf install golang latest
asdf global golang latest

asdf plugin add nodejs || echo "Node.js plugin already installed"
asdf install nodejs latest
asdf global nodejs latest

asdf plugin add pnpm || echo "pnpm plugin already installed"
asdf install pnpm latest
asdf global pnpm latest

asdf plugin add yarn || echo "yarn plugin already installed"
asdf install yarn latest
asdf global yarn latest

# Install GitHub CLI
echo "Installing GitHub CLI..."
brew install gh

# Install Hack Nerd Font
echo "Installing Hack Nerd Font..."
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

echo "Setup complete! Restart your terminal to apply changes."
