#!/usr/bin/env fish

set default_folders .config Videos Documents Downloads Music Pictures/screenshot

set packages \
  bspwm \
  sxhkd \
  picom \
  polybar \
  rofi \
  feh \
  xorg \
  xorg-xinit \
  pipewire \
  pipewire-pulse \
  pipewire-alsa \
  pavucontrol \
  nvidia \
  nvidia-utils \
  nvidia-settings \
  thunar \
  thunar-archive-plugin \
  ranger \
  xclip \
  gvfs-smb \
  mpv \
  ffmpegthumbnailer \
  tumbler \
  gthumb \
  playerctl \
  pamixer \
  firefox \
  obs-studio \
  obsidian \
  discord \
  telegram-desktop \
  cava \
  lazydocker \
  bat \
  tree \
  lsd \
  ripgrep \
  fd \
  tree-sitter-cli \
  gzip \
  p7zip \
  unzip \
  unrar \
  zip \
  fastfetch \
  calcurse \
  htop \
  btop \
  fish \
  starship \
  zsh \
  ttf-jetbrains-mono \
  ttf-jetbrains-mono-nerd \
  noto-fonts-emoji \
  wezterm \
  neovim \
  xarchiver \
  sudo \
  openssh \
  flameshot \
  screenkey \
  cloc \
  lollypop \
  gimp \
  git \
  gcc \
  clang \
  openrgb \
  spotify-launcher

set aur_packages nitrogen deadbeef

set install_result
set aur_install_result

function yay_install
  mkdir -p temp
  git clone https://aur.archlinux.org/yay.git temp/yay
  pushd temp/yay
  makepkg -si --noconfirm
  popd
  rm -rf temp
end

function install_pacman_package
  for pac in $packages
    sudo pacman -S --noconfirm $pac
    if test $status -eq 0
      set install_result $install_result (set_color green)"[+]"
    else
      set install_result $install_result (set_color red)"[-]"
    end
  end
end

function install_aur_package
  for pac in $aur_packages
    yay -S --noconfirm $pac
    if test $status -eq 0
      set aur_install_result $aur_install_result (set_color green)"[+]"
    else
      set aur_install_result $aur_install_result (set_color red)"[-]"
    end
  end
end

function show_install_result
  for i in (seq (count $packages))
    printf "%-8s %s\n" $install_result[$i] $packages[$i]
    sleep 0.2
  end
  for i in (seq (count $aur_packages))
    printf "%-8s %s\n" $aur_install_result[$i] $aur_packages[$i]
    sleep 0.2
  end
  echo (set_color normal)
end

mkdir -p ~/{$default_folders}

sudo pacman -Syu --noconfirm

install_pacman_package

yay_install

install_aur_package

show_install_result

chsh -s /usr/bin/fish

sudo ln -sf /usr/bin/wezterm /usr/bin/xterm

ln -sf ~/.dotfiles/config/* ~/.config/
ln -sf ~/.dotfiles/xinitrc ~/.xinitrc
ln -sf ~/.dotfiles/gtkrc-2.0 ~/.gtkrc-2.0
ln -sf ~/.dotfiles/icons/ ~/.icons
ln -sf ~/.dotfiles/themes/ ~/.themes
ln -sf ~/.dotfiles/wallpaper/ ~/.wallpaper
