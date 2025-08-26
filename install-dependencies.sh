#!/bin/bash

# Install dependencies for enhanced Yazi preview functionality
# Run with: bash install-dependencies.sh

set -e

echo "🔧 Installing Yazi preview dependencies..."

# Update package list
echo "📦 Updating package list..."
sudo apt update

# Essential preview tools
echo "🛠️  Installing essential preview utilities..."

# Text and web content tools
sudo apt install -y \
    w3m \
    lynx \
    poppler-utils \
    pandoc \
    file \
    dpkg-dev \
    ueberzug

# Additional useful tools (optional but recommended)
echo "🎨 Installing additional preview utilities..."

# Image tools (alternatives to kitten icat)
sudo apt install -y \
    chafa \
    imagemagick

# Development and analysis tools
sudo apt install -y \
    hexyl \
    mediainfo \
    exiftool

# Document conversion tools
sudo apt install -y \
    libreoffice \
    antiword

echo "✅ Package installation complete!"

# Check for Rust/Cargo tools
if command -v cargo &> /dev/null; then
    echo "🦀 Installing Rust-based tools via cargo..."
    
    # Image viewer for terminal
    if ! command -v viu &> /dev/null; then
        cargo install viu
    fi
    
    # Better hex viewer (if not installed via apt)
    if ! command -v hexyl &> /dev/null; then
        cargo install hexyl
    fi
    
    echo "✅ Cargo tools installation complete!"
else
    echo "⚠️  Cargo not found. Some optional tools skipped."
    echo "   Install Rust/Cargo for additional preview utilities:"
    echo "   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
fi

# Check installation status
echo ""
echo "🔍 Checking installed tools:"
echo "----------------------------------------"

check_tool() {
    if command -v "$1" &> /dev/null; then
        echo "✅ $1 - installed"
    else
        echo "❌ $1 - missing"
    fi
}

# Essential tools
check_tool "w3m"
check_tool "lynx" 
check_tool "pdftotext"
check_tool "pandoc"
check_tool "file"

# Image display support
check_tool "ueberzugpp"

# Kitty image support test
if command -v kitten &> /dev/null; then
    echo "✅ kitten - installed"
    # Test if we can access terminal for image display
    if [[ -n "$KITTY_WINDOW_ID" ]] && [[ "$TERM" == "xterm-kitty" ]]; then
        echo "   ℹ️  Kitty terminal detected - image display should work"
    else
        echo "   ⚠️  Not in Kitty terminal - images will fall back to ASCII art"
    fi
else
    echo "❌ kitten - missing (install Kitty terminal)"
fi

# Optional tools
check_tool "chafa"
check_tool "viu"
check_tool "hexyl"
check_tool "mediainfo"
check_tool "exiftool"

echo "----------------------------------------"
echo "🎉 Setup complete! Restart Yazi to use enhanced previews."
echo ""
echo "📖 New preview features:"
echo "   🖼️  Images: Built-in Yazi support (Kitty/X11)"
echo "   📄 PDF: Text preview (first 3 pages)"
echo "   🌐 HTML: Clean text output"
echo "   📝 DOC/DOCX: Plain text conversion"
echo "   ⚙️  Binary files: File type summary"
echo "   📦 Archives: File listing (already working)"
echo "   📦 .deb packages: Package info + file contents"
echo "   🔄 .zsync files: Metadata preview"
echo ""
echo "🚀 Run 'yazi' to test the new preview functionality!"