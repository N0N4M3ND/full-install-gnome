mkfs.ext4 /dev/sda3 &&
mkfs.fat -F 32 /dev/sda1 &&
mkswap /dev/sda2 &&
mount /dev/sda3 /mnt &&
mount --mkdir /dev/sda1 /mnt/boot/efi &&
swapon /dev/sda2 &&
pacman -Syy archlinux-keyring figlet --noconfirm &&
pacstrap /mnt base base-devel code efibootmgr eog file-roller firefox gdm git gnome-bluetooth gnome-control-center gnome-shell gnome-terminal gnome-tweaks grub htop intel-ucode linux linux-firmware linux-headers nautilus net-tools networkmanager ntfs-3g openssh papirus-icon-theme pipewire pipewire-alsa pipewire-jack pipewire-media-session pipewire-pulse mpv ttf-jetbrains-mono xf86-video-intel &&
arch-chroot /mnt grub-install /dev/sda &&
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg &&
arch-chroot /mnt ln -sf /usr/share/zoneinfo/Asia/Tbilisi /etc/localtime &&
arch-chroot /mnt sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen &&
arch-chroot /mnt sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub &&
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg &&
arch-chroot /mnt locale-gen &&
arch-chroot /mnt touch /etc/hostname &&
arch-chroot /mnt echo archlinux > /etc/hostname &&
arch-chroot /mnt touch /etc/locale.conf &&
arch-chroot /mnt echo LANG=en_US.UTF-8 > /etc/locale.conf &&
arch-chroot /mnt passwd &&
arch-chroot /mnt useradd -m -G wheel -s /bin/bash arch &&
arch-chroot /mnt passwd arch &&
arch-chroot /mnt sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers &&
arch-chroot /mnt systemctl enable bluetooth &&
arch-chroot /mnt systemctl enable gdm &&
arch-chroot /mnt systemctl enable NetworkManager &&
genfstab -U /mnt > /mnt/etc/fstab &&
figlet installation finished reboot system
