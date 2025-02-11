#!/bin/bash

print_status() {
    echo "===> $1"
}

check_error() {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}

print_status "Updating system"
sudo apt update
check_error "Failed to update package list"
sudo apt upgrade -y
check_error "Failed to upgrade packages"

print_status "Installing basic packages"
sudo apt install -y build-essentials gcc git curl wget
check_error "Failed to install basic packages"

print_status "Installing basic tools"
sudo apt install -y stow ripgrep fzf xclip
check_error "Failed to install basic tools"

print_status "Setting up zsh"
sudo apt install -y zsh
check_error "Failed to install zsh"

if [ "$SHELL" != "/bin/zsh" ]; then
    print_status "Changing default shell to zsh"
    chsh -s /bin/zsh
    check_error "Failed to change default shell to zsh"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_status "Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    check_error "Failed to install Oh My Zsh"
fi

print_status "Installing zsh plugins"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    check_error "Failed to install zsh-syntax-highlighting"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    check_error "Failed to install zsh-autosuggestions"
fi

print_status "Setting up tmux"
sudo apt install -y tmux
check_error "Failed to install tmux"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    check_error "Failed to install TPM"
fi

# Setup JDK via SDKMAN
print_status "Setting up JDK"
if [ ! -d "$HOME/.sdkman" ]; then
    curl -s "https://get.sdkman.io" | bash
    check_error "Failed to install SDKMAN"
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk install java 17.0.13-amzn
    check_error "Failed to install Java"
fi

# Setup Coursier
print_status "Setting up Coursier"
if [ ! -f "$HOME/.local/share/coursier/bin/cs" ]; then
    curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d >cs && chmod +x cs && ./cs setup
    check_error "Failed to install Coursier"
    grep -q "COURSIER_HOME" "$HOME/.zshrc" || echo 'export COURSIER_HOME="$HOME/.local/share/coursier"' >>"$HOME/.zshrc"
    grep -q "PATH.*COURSIER_HOME" "$HOME/.zshrc" || echo 'export PATH="$PATH:$COURSIER_HOME/bin"' >>"$HOME/.zshrc"
    rm -f "$HOME/cs"
fi

# Setup NVM
print_status "Setting up NVM"
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    check_error "Failed to install NVM"
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install --lts
    check_error "Failed to install Node.js LTS"
fi

# Setup Neovim
print_status "Setting up Neovim"
if [ ! -d "$HOME/personal/neovim" ]; then
    mkdir -p "$HOME/personal"
    git clone -b v0.10.3 https://github.com/neovim/neovim.git "$HOME/personal/neovim"
    check_error "Failed to clone Neovim"
    sudo apt install -y cmake gettext lua5.1 liblua5.1-0-dev
    check_error "Failed to install Neovim dependencies"
    cd "$HOME/personal/neovim"
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    check_error "Failed to make Neovim"
    sudo make install
    check_error "Failed to install Neovim"
fi

# Setup WezTerm
print_status "Setting up WezTerm"
if ! command -v wezterm &>/dev/null; then
    curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
    echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
    sudo apt update
    sudo apt install -y wezterm
    check_error "Failed to install WezTerm"
fi

# Setup Lazygit
print_status "Setting up Lazygit"
if ! command -v lazygit &>/dev/null; then
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit -D -t /usr/local/bin/
    rm -rf "$HOME/lazygit" "$HOME/lazygit.tar.gz"
    check_error "Failed to install Lazygit"
fi

# Setup i3
print_status "Setting up i3"
sudo apt install -y i3 i3status network-manager-gnome blueman
sudo apt install -y flameshot peek picom rofi
sudo apt install -y pulseaudio-utils playerctl
check_error "Failed to install i3 and related packages"

# Konfiguracja GTK dark theme
mkdir -p "$HOME/.config/gtk-4.0" "$HOME/.config/gtk-3.0"
echo '[Settings]
gtk-application-prefer-dark-theme=1' | tee "$HOME/.config/gtk-4.0/settings.ini" "$HOME/.config/gtk-3.0/settings.ini" >/dev/null

# Setup dotfiles
print_status "Setting up dotfiles"
if [ ! -d "$HOME/personal/dotfiles" ]; then
    # Załóżmy że repozytorium jest na GitHubie, podmień URL na właściwy
    git clone https://github.com/TWÓJ_USERNAME/dotfiles.git "$HOME/personal/dotfiles"
    check_error "Failed to clone dotfiles repository"

    # Przejdź do katalogu z dotfiles
    cd "$HOME/personal/dotfiles"

    # Wykonaj stow dla każdego katalogu
    for dir in bin i3 nvim tmux wezterm zsh; do
        if [ -d "$dir" ]; then
            stow -v "$dir"
            check_error "Failed to stow $dir"
        else
            echo "Warning: Directory $dir not found in dotfiles"
        fi
    done
fi

print_status "Setup completed successfully!"
echo "Please log out and log back in for all changes to take effect."
