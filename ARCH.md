# Initial setup guide

### Pacman packages
- base
- base-devel
- git
- neofetch
- htop
- unzip
- zip

### Git setup
1. `git config --global user.email "dudek.michal1996@gmail.com"`
2. `git config --global user.name "mikovsky"`

### paru installation
1. `git clone https://aur.archlinux.org/paru.git`
2. `cd paru`
3. `makepkg -si`
4. `paru -S reflector` - for setting up mirrors
5. `sudo reflector --verbose --country Poland,Germany,Czech,France,Austria,Netherlands,Italy --latest 100 --protocol https --sort rate --number 20 --save /etc/pacman.d/mirrorlist` - setup 20 best mirrors

### paru packages
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
- spectacle -> screenshots tool
- xclip -> clipboard support

### zsh installation
1. Install zsh `paru -S zsh`
2. Change default shell `chsh -s /usr/bin/zsh`
3. Log out from the system
4. Verify default shell with: `echo $SHELL`
5. Install oh-my-zsh `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
6. Install NerdFont `paru -S ttf-meslo-nerd`
7. Set this NerdFont as terminal default
8. (Optional) Install powerlevel10k `paru -S --noconfirm zsh-theme-powerlevel10k-git`
9. (Optional) Setup powerlevel10k `echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc`
10. Install zsh-syntax-highlighting plugin `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
11. Install zsh-autosuggestions plugin `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

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
2. Run `<C-s>` + `shift + i` to install plugins using TPM

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
1. Install nvm using `paru -S nvm`
2. Source nvm using `echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc`
3. Restart terminal
4. Install LTS using `nvm install --lts`
5. Check installation using `node -v` i `npm --v`

### Bluetooth setup
1. Install bluez standard protocol `paru -S bluez bluez-utils`
2. Enable Bluetooth service `sudo systemctl enable bluetooth.service`
3. Start Bluetooth service `sudo systemctl start bluetooth.service`

### Spotify setup
1. Install Spotify Launcher so it can updates itself without pacman `paru -S spotify-launcher`
2. Before running it make sure that locale is set accordingly to documentation here: [Arch Linux - Documentation](https://wiki.archlinux.org/title/Installation_guide#Localization)

### Timeshift setup
1. `paru -S timeshift` - install Timeshift for creating snapshots, restoring from snapshots, etc.
2. `paru -S grub-btrfs` - install grub-btrfs, so we can load snapshots from grub bootloader
   - `sudo /etc/grub.d/41_snapshots-btrfs` - manually generate grub entries based on existing snapshots
   - `grub-mkconfig -o /boot/grub/grub.cfg` - generate grub config with these snapshots
4. `paru -S inotify-tools` - tool for notifying other system services when some file changes
5. `sudo systemctl edit --full grub-btrfsd` - update grub-btrfsd system daemon
6. `ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto` - update line with ExecStart to this, so it can pickup Timeshift snapshots automatically (C-O) (Enter) to save
7. `sudo systemctl enable grub-btrfsd`
8. `sudo systemctl start grub-btrfsd`
9. `paru -S timeshift-autosnap` - install tool that will automatically create snapshots when updating packages via pacman
10. Set `updateGrub=false` in file `/etc/timeshift-autosnap.conf` to prevent interference with `grub-btrfsd`
