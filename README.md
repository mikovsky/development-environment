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

### yay packages
- google-chrome
- alacritty

### zsh installation
1. `yay -S zsh`
2. `chsh -s /usr/bin/zsh`
3. Log out
4. Verify default shell with: `echo $SHELL`
