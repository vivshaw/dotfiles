#!/usr/bin/env bash

# this script does two things:
#  - provision Ansible
#  - use Ansible to run the provided playbook
# 
# doing the requires a number of prereq dependencies:
#  - git
#  - Python3
#  - pip
#  - pipx
#  - on macOS, homebrew

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            if [[ "$ID" == "ubuntu" ]] || [[ "$ID_LIKE" == *"ubuntu"* ]] || [[ "$ID_LIKE" == *"debian"* ]]; then
                echo "debian"
            else
                echo "unknown-linux"
            fi
        else
            echo "unknown-linux"
        fi
    else
        echo "unknown"
    fi
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

install_macos_prerequisites() {
    log_info "installing prerequisites for macOS..."
    
    # check and install Homebrew
    if ! command_exists brew; then
        log_info "installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add Homebrew to PATH for this session
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [[ -f "/usr/local/bin/brew" ]]; then
            eval "$(/usr/local/bin/brew shellenv)"
        fi
    else
        log_info "homebrew already installed ✓"
    fi
    
    # check and install Git
    if ! command_exists git; then
        log_info "installing git..."
        brew install git
    else
        log_info "git already installed ✓"
    fi
    
    # check and install Python3
    if ! command_exists python3; then
        log_info "installing python3..."
        brew install python3
    else
        log_info "python3 already installed ✓"
    fi
    
    # pip should come with Python3 on macOS, but let's verify
    if ! command_exists pip3; then
        log_warn "pip3 not found, attempting to install..."
        python3 -m ensurepip --upgrade
    else
        log_info "pip3 already installed ✓"
    fi
    
    # check and install pipx
    if ! command_exists pipx; then
        log_info "installing pipx..."
        brew install pipx
    else
        log_info "pipx already installed ✓"
    fi

    # get pipx-installed utils onto $PATH
    pipx ensurepath >/dev/null 2>&1 || true

    # source the updated $PATH
    if [[ -f "$HOME/.bashrc" ]]; then
        export PATH="$HOME/.local/bin:$PATH"
    fi
    if [[ -f "$HOME/.zshrc" ]]; then
        export PATH="$HOME/.local/bin:$PATH"
    fi
}

install_debian_prerequisites() {
    log_info "installing prerequisites for Debian..."
    
    log_info "updating package list..."
    sudo apt update
    
    # check and install git
    if ! command_exists git; then
        log_info "installing git..."
        sudo apt install -y git
    else
        log_info "git already installed ✓"
    fi
    
    # check and install Python3
    if ! command_exists python3; then
        log_info "installing python3..."
        sudo apt install -y python3
    else
        log_info "python3 already installed ✓"
    fi
    
    # check and install pip3
    if ! command_exists pip3; then
        log_info "installing pip3..."
        sudo apt install -y python3-pip
    else
        log_info "pip3 already installed ✓"
    fi
    
    # check and install pipx
    if ! command_exists pipx; then
        log_info "installing pipx..."
        sudo apt install -y pipx
    else
        log_info "pipx already installed ✓"
    fi

    # get pipx-installed utils onto $PATH
    pipx ensurepath

    # source the updated $PATH
    if [[ -f "$HOME/.bashrc" ]]; then
        export PATH="$HOME/.local/bin:$PATH"
    fi
    if [[ -f "$HOME/.zshrc" ]]; then
        export PATH="$HOME/.local/bin:$PATH"
    fi
}

# install Ansible (via pipx)
install_ansible() {
    log_info "checking Ansible installation..."
    
    # check if Ansible is already installed
    if command_exists ansible; then
        log_info "Ansible already installed ✓"
        ansible --version | head -n 1
    else
        log_info "installing Ansible via pipx..."
        pipx install ansible-core
        log_info "Ansible installed ✓"
    fi
}

install_ansible_deps() {
    log_info "installing Ansible dependencies..."

    # install the community.general collection
    ansible-galaxy collection install community.general
    log_info "Ansible dependencies installed ✓"
}

run_playbook() {
    log_info "running Ansible playbook..."
    ansible-playbook main.yml --ask-become-pass
    log_info "Ansible playbook completed ✓"
}

main() {
    log_info "starting system configuration..."
    echo ""
    
    OS=$(detect_os)
    log_info "detected OS: $OS"
    echo ""
    
    case $OS in
        macos)
            install_macos_prerequisites
            ;;
        debian)
            install_debian_prerequisites
            ;;
        unknown-linux)
            log_error "unsupported Linux distribution. this script supports Ubuntu/Debian-based systems."
            exit 1
            ;;
        *)
            log_error "unsupported operating system: $OSTYPE"
            exit 1
            ;;
    esac
    
    echo ""
    install_ansible
    echo ""
    install_ansible_deps
    echo ""
    run_playbook
    echo ""
    log_info "✓ system configured!"
    echo ""
}

main
