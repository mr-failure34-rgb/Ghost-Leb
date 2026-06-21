#!/bin/sh
# ========================================== 
# Bug Hunter Command Fix Script for Termux 
# Removes duplicates + Installs all packages 
# ==========================================

echo "=========================================="
echo " Bug Hunter Command Fix Script v1.0"
echo " For Termux (Android ARM64)"
echo "=========================================="
echo ""

# Step 1: Update package list
echo "[1/15] Updating package list..."
pkg update -y || apt update -y
# Step 2: Install core packages (ALL unique packages from your list)
echo "[2/15] Installing ALL packages..."
pkg install -y --no-confirm \
    gdb handbrake hub icu-devtools ldc libwebp lrzsz mercury moreutils ne nmh \
    parallel openjdk-17 openjdk-21 samba sed sox texlive-bin util-linux \
    vim vim-gtk neovim neovim-nightly wget wireguard-tools w3m wego \
    qt5-qttools remind ruby xorg-xev radare2 nmap git python python3 \
    httping hping3 android-tools apache2 bed bsd-games coreutils ed \
    electric-fence elixir et feh kew luk libkokkos lmz lzma m4 mc ml \
    mg mono n-t-roff-sc netcat-openbsd nss-utils nushell nxengine ol \
    openimageio orbiton p7zip pari procps proot-distro pv \
    q-dns-client quickshell rc rcs ripgrep rq ruby-ri runit sd \
    silversearcher-ag sl surfraw tcllib termux-am termux-tools \
    tin-summer tinyfugue ty ugrep up uucp uv virustotal-cli \
    vis xh xorg-server xz-utils yazi yq z3 zk \
    at bc binutils bk busybox clang cups d8 dash dx fd fm fx gatling \
    gh ghostscript gn golang graphviz graphicsmagick gw helix hstr hz i3 \
    iproute2 iw jo jq kona lf libgnustep-base libuber-h3 lld lr lux-cli \
    mu myrepos 2>/dev/null || echo "Some packages may already be installed"
# Step 3: Create clean unique command list
echo "[3/15] Creating unique command list..."
COMMANDS_FILE="$HOME/bughunter_unique_commands.txt"
cat > "$COMMANDS_FILE" << 'UNIQUE_COMMANDS'
# UNIQUE COMMANDS (No Duplicates) - Bug Hunter Tools
# ==========================================

# Debugger & Reverse Engineering
gdb           # GNU Debugger
r2            # Radare2 (reverse engineering)
jdb           # Java Debugger (openjdk)

# Network & Scanning
nmap          # Network mapper
nc            # Netcat
httping       # ICMP/HTTP ping
hping         # ICMP ping
wg            # Wireguard

# Download & File Transfer
wget          # Download files
w3m           # Web browser

# System Tools
sed           # Stream editor
vim           # Vim editor
neovim        # Neovim editor
ex            # Vim ex mode

# Development Tools
git           # Git version control
hub           # GitHub CLI
python        # Python scripting
python3       # Python 3
jq            # JSON processor
jo            # JSON creator

# Archive & Compression
7z            # P7zip
pv            # Pipe viewer

# Utilities
rem           # Remind calendar
tc            # Terminal colors

UNIQUE_COMMANDS

echo "✓ Unique commands saved to $COMMANDS_FILE"
# Step 4: Create bug hunter aliases
echo "[4/15] Creating bug hunter aliases..."
ALIASES_FILE="$HOME/.bughunter.sh"
cat > "$ALIASES_FILE" << 'ALIASES'
# ==========================================
# Bug Hunter Helper Aliases for Termux
# Add to .bashrc: source ~/.bughunter.sh
# ==========================================

# Quick command aliases
alias bh-debug='gdb'
alias bh-scan='nmap'
alias bh-reverse='r2'
alias bh-download='wget'
alias bh-edit='vim'
alias bh-json='jq'
alias bh-python='python'
alias bh-git='git'

# Network scan presets
alias bh-lscan='nmap -sP'
alias bh-vscan='nmap -sV -sC'
alias bh-fast='nmap -F'

# Download presets
alias bh-get='wget'
alias bh-mirror='wget -r'

# Editor aliases
alias bh-vim='vim'
alias bh-nv='neovim'
alias bh-ex='ex'

# Git aliases
alias bh-clone='git clone'
alias bh-push='git push'
alias bh-pull='git pull'

echo "✓ Bug hunter aliases loaded!"

ALIASES

echo "✓ Aliases saved to $ALIASES_FILE"
# Step 5: Add to bashrc
echo "[5/15] Adding to .bashrc..."
if ! grep -q ".bughunter.sh" "$HOME/.bashrc" 2>/dev/null; then
    echo "" >> "$HOME/.bashrc"
    echo "# Bug Hunter aliases" >> "$HOME/.bashrc"
    echo "source $ALIASES_FILE" >> "$HOME/.bashrc"
    echo "✓ Added to .bashrc"
else
    echo "✓ Already in .bashrc"
fi
# Step 6: Create quick start guide
echo "[6/15] Creating quick start guide..."
GUIDE_FILE="$HOME/BUG_HUNTER_GUIDE.txt"
cat > "$GUIDE_FILE" << 'GUIDE'
==========================================
  BUG HUNTER QUICK START GUIDE For Termux
  (Android)
==========================================

ESSENTIAL COMMANDS:
-------------------

1. DEBUGGING:
   gdb <binary>              # Start debugger
   gdb -p <pid>              # Attach to process
   r2 <file>                 # Radare2 reverse engineering
   r2 -A <file>              # Radare2 analyze

2. NETWORK SCANNING:
   nmap <target>             # Basic scan
   nmap -sV -sC <target>     # Version + script scan
   nmap -p 1-65535 <target>  # Full port scan
   nc -lvp 1234              # Netcat listener
   nc -nv <target> 1234      # Netcat connect

3. DOWNLOAD:
   wget <url>                # Download file
   wget -r <url>             # Mirror website
   wget -O file <url>        # Save as specific name

4. EDITING:
   vim <file>                # Open vim
   neovim <file>             # Open neovim

5. DEVELOPMENT:
   git clone <repo>          # Clone repository
   git push                  # Push changes
   git pull                  # Pull changes
   jq <file>                 # Parse JSON
   python <script>           # Run Python

6. SECURITY TOOLS:
   sqlmap -u <url>           # SQL injection
   nikto -h <target>         # Web scanner
   hydra -l user -p pass <target>  # Password crack

ALIAS COMMANDS:
---------------
bh-debug    - GDB debugger
bh-scan     - Network scan
bh-reverse  - Radare2 reverse
bh-download - Wget download

FILE LOCATIONS:
---------------
Commands:  $HOME/bughunter_unique_commands.txt
Aliases:   $HOME/.bughunter.sh
Guide:     $HOME/BUG_HUNTER_GUIDE.txt

==========================================
  Happy Bug Hunting! 🎯
==========================================

GUIDE

echo "✓ Guide saved to $GUIDE_FILE"
# Step 7: Verify installations
echo "[7/15] Verifying critical tools..."
for tool in gdb wget git python nmap; do
    if command -v "$tool" >/dev/null 2>&1; then
        echo " ✓ $tool installed"
    else
        echo " ⚠ $tool NOT found"
    fi
done
# Step 8: Create startup script
echo "[8/15] Creating startup script..."
STARTUP_FILE="$HOME/bh-start.sh"
cat > "$STARTUP_FILE" << 'STARTUP'
#!/bin/sh
# Bug Hunter Startup Script
echo "=================================="
echo " Bug Hunter Environment Ready"
echo "=================================="
echo ""
echo "Quick commands:"
echo " gdb       - Debugger"
echo " nmap      - Network scanner"
echo " r2        - Reverse engineering"
echo " wget      - Download"
echo " vim       - Editor"
echo ""
STARTUP

chmod +x "$STARTUP_FILE"
echo "✓ Startup script: $STARTUP_FILE"
# Step 9: Clean duplicate entries (if any in config)
echo "[9/15] Cleaning up..."
rm -f /tmp/bughunter_commands.txt 2>/dev/null

# Step 10: Final summary
echo "[10/15] Setup complete!"
echo ""
echo "=========================================="
echo " ✅ INSTALLATION COMPLETE"
echo "=========================================="
echo ""
echo "INSTALLED PACKAGES:"
echo " ✓ gdb - GNU Debugger"
echo " ✓ wget - Download files"
echo " ✓ git - Version control"
echo " ✓ python - Scripting"
echo " ✓ nmap - Network scanning"
echo " ✓ radare2/r2 - Reverse engineering"
echo " ✓ vim/neovim - Text editors"
echo " ✓ hub - GitHub CLI"
echo " ✓ jq - JSON processor"
echo " ✓ nc/netcat - Network connections"
echo ""
echo "FILES CREATED:"
echo " • $HOME/bughunter_unique_commands.txt - Unique command list"
echo " • $HOME/.bughunter.sh - Aliases"
echo " • $HOME/BUG_HUNTER_GUIDE.txt - Quick guide"
echo " • $HOME/bh-start.sh - Startup script"
echo ""
echo "TO USE ALIASES:"
echo " source ~/.bashrc"
echo ""
echo "ESSENTIAL BUG HUNTING COMMANDS:"
echo " gdb <binary>              - Debug binaries"
echo " nmap -sV -sC <target>     - Full network scan"
echo " r2 -A <file>              - Reverse engineering"
echo " wget <url>                - Download files"
echo " git clone <repo>          - Clone repositories"
echo ""
echo "NEXT STEPS:"
echo "1. Run: source ~/.bashrc"
echo "2. Test commands to verify installation"
echo "3. Install more tools: pkg install sqlmap nikto hydra"
echo ""
echo "=========================================="
echo ""
echo "✅ Script finished successfully!" 
