#!/usr/bin/env bash
# macOS system defaults — ejecutar tras instalar en Mac nuevo
# Basado en la config de angelhpascual, Mayo 2026

set -e

echo "🍏 Aplicando configuración de macOS..."

# ─── Dock ───────────────────────────────────────────────────────────────────
echo "  → Dock"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.3
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock minimize-to-application -bool true

# ─── Finder ─────────────────────────────────────────────────────────────────
echo "  → Finder"
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"  # buscar en carpeta actual
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"  # list view
defaults write com.apple.finder AppleShowAllFiles -bool true          # mostrar archivos ocultos
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# No crear .DS_Store en volumes de red o USB
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ─── Teclado ────────────────────────────────────────────────────────────────
echo "  → Teclado"
defaults write NSGlobalDomain KeyRepeat -int 1                # repetición muy rápida
defaults write NSGlobalDomain InitialKeyRepeat -int 15        # delay antes de repetir
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false  # repetición en vez de acentos

# ─── Trackpad ───────────────────────────────────────────────────────────────
echo "  → Trackpad"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1  # tap to click

# ─── Pantalla ───────────────────────────────────────────────────────────────
echo "  → Pantalla"
defaults write NSGlobalDomain AppleFontSmoothing -int 1
defaults write com.apple.universalaccess reduceMotion -bool false

# ─── Screenshots ────────────────────────────────────────────────────────────
echo "  → Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

# ─── Privacidad / Seguridad ─────────────────────────────────────────────────
echo "  → Seguridad"
defaults write com.apple.LaunchServices LSQuarantine -bool false  # no "¿abrir app descargada?"

# ─── Terminal / Dev ──────────────────────────────────────────────────────────
echo "  → Dev"
# Mostrar la carpeta Library en Finder
chflags nohidden ~/Library

# ─── Aplicar cambios ────────────────────────────────────────────────────────
echo "  → Reiniciando procesos afectados..."
killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true
killall SystemUIServer 2>/dev/null || true

echo "✅ macOS defaults aplicados. Puede que necesites cerrar sesión para que algunos cambios surtan efecto."
