#!/usr/bin/env bash
# Bootstrap — restaurar configuración completa en un Mac nuevo
# Uso: curl -fsSL https://raw.githubusercontent.com/angelhpascual/dotfiles/main/install.sh | bash

set -e

DOTFILES_REPO="https://github.com/angelhpascual/dotfiles"
GITHUB_USER="angelhpascual"

echo "🚀 Iniciando bootstrap de dotfiles..."
echo ""

# ─── 1. Xcode Command Line Tools ────────────────────────────────────────────
if ! command -v git &>/dev/null; then
  echo "📦 Instalando Xcode Command Line Tools..."
  xcode-select --install
  echo "   Espera a que termine la instalación y vuelve a ejecutar este script."
  exit 0
fi

# ─── 2. Homebrew ────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "🍺 Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ─── 3. chezmoi ─────────────────────────────────────────────────────────────
if ! command -v chezmoi &>/dev/null; then
  echo "🏠 Instalando chezmoi..."
  brew install chezmoi
fi

# ─── 4. Aplicar dotfiles con chezmoi ────────────────────────────────────────
echo "📁 Aplicando dotfiles desde GitHub..."
chezmoi init --apply "$GITHUB_USER"

# ─── 5. Instalar paquetes Homebrew ──────────────────────────────────────────
BREWFILE="$HOME/.dotfiles/Brewfile"
if [ -f "$BREWFILE" ]; then
  echo "🍺 Instalando paquetes de Homebrew..."
  brew bundle install --file="$BREWFILE"
fi

# ─── 6. macOS defaults ──────────────────────────────────────────────────────
DEFAULTS_SCRIPT="$HOME/.dotfiles/macos/defaults.sh"
if [ -f "$DEFAULTS_SCRIPT" ]; then
  echo "🍏 Aplicando configuración de macOS..."
  bash "$DEFAULTS_SCRIPT"
fi

# ─── 7. Recordatorio secrets ────────────────────────────────────────────────
echo ""
echo "⚠️  Recuerda crear ~/.secrets con tus API keys:"
echo "   export GROQ_API_KEY=\"...\""
echo "   export ANTHROPIC_AUTH_TOKEN=\"...\""
echo ""
echo "✅ Bootstrap completado!"
