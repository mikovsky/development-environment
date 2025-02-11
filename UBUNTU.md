# Ubuntu - Setup Guide

### Update base system

1. `sudo apt update`
1. `sudo apt upgrade -y`

### Basic packages

1. `sudo apt install -y build-essential`
1. `sudo apt install -y gcc`
1. `sudo apt install -y git`
1. `sudo apt install -y curl`
1. `sudo apt install -y wget`

### Basic tooling

1. `sudo apt install -y stow`
1. `sudo apt install -y ripgrep`
1. `sudo apt install -y fzf`
1. `sudo apt install -y xclip`

### zsh setup

1. `sudo apt install -y zsh`
1. `chsh -s /usr/bin/zsh` - change default shell to zsh
1. Logout from the system
1. `echo $SHELL` - verify default shell
1. `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` - install oh-my-zsh
1. `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting` - install zsh-syntax-highlighting
1. `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions` - install zsh-autosuggestions
1. `plugins=(git zsh-syntax-highlighting zsh-autosuggestions)` - add to .zshrc file

### tmux setup

1. `sudo apt install -y tmux` - install tmux
1. `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` - install tpm
1. Enter tmux and type `<C-s>` + `shift + i` to setup tpm

### JDK setup

1. `curl -s "https://get.sdkman.io" | bash` - install sdkman
1. `source "$HOME/.sdkman/bin/sdkman-init.sh"` - initialize sdkman
1. `sdk install java 17.0.13-amzn` - install JDK

### Coursier setup

1. `curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup`
1. `export COURSIER_HOME="$HOME/.local/share/coursier"` - add this to .zshrc
1. `export PATH="$PATH:$COURSIER_HOME/bin"` - add this to .zshrc
1. `rm ~/cs` - remove cs from HOME

### NVM setup

1. `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash` - install nvm
1. `nvm install --lts` - install LTS
1. `node -v` and `npm --v` - verify installation

### Neovim setup

1. `git clone -b v0.10.3 https://github.com/neovim/neovim.git $HOME/personal/neovim` - clone neovim
1. `sudo apt install -y cmake gettext lua5.1 liblua5.1-0-dev` - install packages for neovim
1. `cd $HOME/personal/neovim` - go to neovim directory
1. `make CMAKE_BUILD_TYPE=RelWithDebInfo` - make neovim
1. `sudo make install` - install neovim

### wezterm

1. `curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg` - clone GPG key for wezterm
1. `echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list` - setup GPG key for wezterm
1. `sudo apt update` - update apt repositories
1. `sudo apt install -y wezterm` - install wezterm

### lazygit setup

1. `LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/` - install lazygit
1. `rm -rf ~/lazygit ~/lazygit.tar.gz` - remove leftovers
1. `lazygit --version` - verify installation

### i3 setup

1. `sudo apt install -y i3 i3status network-manager-gnome blueman`
1. `sudo apt install -y flameshot peek picom rofi`
1. `sudo apt install -y pulseaudio-utils playerctl`
1. Add this to files `$HOME/.config/gtk-4.0/settings.ini` and `$HOME/.config/gtk-3.0/settings.ini`:

```
[Settings]
gtk-application-prefer-dark-theme=1
```
