# Initial setup guide

### Pacman packages
- base
- base-devel
- git
- neofetch
- htop
- unzip
- zip

### yay installation
1. `sudo pacman -S --needed base-devel git`
2. `git clone https://aur.archlinux.org/yay.git`
3. `cd yay`
4. `makepkg -si`

### yay packages
- google-chrome (search for ozone flag in chrome://flags, and set it to Wayland)
- (Optional) alacritty
- (Optional) kitty
- wezterm - IMPORTANT => it needs configuration from wezterm.lua (enable_wayland = false)
- stow
- tmux
- neovim
- ripgrep
- lazygit
- fzf
- spectacle
- xclip

### zsh installation
1. Install zsh `yay -S zsh`
2. Change default shell `chsh -s /usr/bin/zsh`
3. Log out from the system
4. Verify default shell with: `echo $SHELL`
5. Install oh-my-zsh `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
6. Install NerdFont `yay -S ttf-meslo-nerd`
7. Set this NerdFont as terminal default
8. (Optional) Install powerlevel10k `yay -S --noconfirm zsh-theme-powerlevel10k-git`
9. (Optional) Setup powerlevel10k `echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc`
10. Install zsh-syntax-highlighting plugin `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
11. Install zsh-autosuggestions plugin `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

### Git setup
1. `git config --global user.email "dudek.michal1996@gmail.com"`
2. `git config --global user.name "mikovsky"`

### ssh-keys setup
1. Create .ssh directory `mkdir ~/.ssh`
2. Generate ssh-key `ssh-keygen -t ed25519 -C "dudek.michal1996@gmail.com"`
3. Download `dotfiles` repository using HTTPS since there is no ssh configuration yet.
4. Link SSH Agent `cd ~/dotfiles && stow ssh-agent-service`
5. Make sure that `~/.zshrc` contains this line `export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"` 
6. Check if ssh-agent is running `systemctl --user status ssh-agent`
7. Enable ssh-agent `systemctl --user enable ssh-agent`
8. Start ssh-agent `systemctl --user start ssh-agent`
9. Add identity to ssh-agent `ssh-add ~/.ssh/<key-name>`

### tmux setup
1. Install TPM `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
2. (Optional) Install Catppuccin Theme
   - `mkdir -p ~/.config/tmux/plugins/catppuccin`
   - `git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux`
3. Run `<C-s>` + `shift + i` to install plugins using TPM

### JDK setup
1. Install SDKMAN `curl -s "https://get.sdkman.io" | bash`
2. Initialize SDKMAN `source "/home/mikovsky/.sdkman/bin/sdkman-init.sh"`
3. Install JDK `sdk install java 17.0.13-amzn`

### Coursier setup
1. Download & setup Coursier `curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup`
2. Add `COURSIER_HOME` env var to `.zshrc` file `export COURSIER_HOME="/home/mikovsky/.local/share/coursier"`
3. Add Coursier to PATH `export PATH="$PATH:$COURSIER_HOME/bin"`
4. Remove cs from home directory `rm ~/cs`

### Node setup
1. Install nvm using `yay -S nvm`
2. Source nvm using `echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc`
3. Restart terminal
4. Install LTS using `nvm install --lts`
5. Check installation using `node -v` i `npm --v`

### Bluetooth setup
1. Install bluez standard protocol `yay -S bluez bluez-utils`
2. Enable Bluetooth service `sudo systemctl enable bluetooth.service`
3. Start Bluetooth service `sudo systemctl start bluetooth.service`

### Spotify setup
1. Install Spotify Launcher so it can updates itself without pacman `yay -S spotify-launcher`
2. Before running it make sure that locale is set accordingly to documentation here: [Arch Linux - Documentation](https://wiki.archlinux.org/title/Installation_guide#Localization)
