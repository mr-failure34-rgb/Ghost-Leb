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

