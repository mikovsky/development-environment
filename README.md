# Initial setup guide

### Pacman packages
- base
- base-devel
- git
- neofetch
- htop

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

### yay packages
- google-chrome
- alacritty
