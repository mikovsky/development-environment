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

### zsh installation
1. Install zsh `yay -S zsh`
2. Change default shell `chsh -s /usr/bin/zsh`
3. Log out from the system
4. Verify default shell with: `echo $SHELL`
5. Install oh-my-zsh `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
6. Install NerdFont `yay -S ttf-meslo-nerd`
7. Set this NerdFont as terminal default
8. Install powerlevel10k `yay -S --noconfirm zsh-theme-powerlevel10k-git`
9. Setup powerlevel10k `echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc`
10. Install zsh-syntax-highlighting plugin `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
11. Install zsh-autosuggestions plugin `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

### Git setup
1. `git config --global user.email "dudek.michal1996@gmail.com"`
2. `git config --global user.name "mikovsky"`
3. `git config pull.rebase true`

### ssh-keys setup
1. Create .ssh directory `mkdir ~/.ssh`
2. Generate ssh-key `ssh-keygen -t ed25519 -C "dudek.michal1996@gmail.com"`
3. Download `dotfiles` repository using HTTPS since there is no ssh configuration yet.
4. Link SSH Agent `cd ~/dotfiles && stow ssh-agent-service`
5. Make sure that `~/.zshrc` contains this line `export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"` 

### tmux setup
1. Install TPM `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

### yay packages
- google-chrome
- alacritty
- stow
- tmux
- neovim
- ripgrep
- lazygit
- fzf
- spectacle

### JDK setup
1. Install SDKMAN `curl -s "https://get.sdkman.io" | bash`
2. Initialize SDKMAN `source "/home/mikovsky/.sdkman/bin/sdkman-init.sh"`
3. Install JDK `sdk install java 17.0.13-amzn`

### Coursier setup
1. Download & setup Coursier `curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup`
2. Add `COURSIER_HOME` env var to `.zshrc` file `export COURSIER_HOME="/home/mikovsky/.local/share/coursier"
3. Add Coursier to PATH `export PATH="$PATH:$COURSIER_HOME/bin"`

### Node setup
1. Install nvm using `yay -S nvm`
2. Source nvm using `echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc`
3. Restart terminal
4. Install LTS using `nvm install --lts`
5. Check installation using `node -v` i `npm --v`
