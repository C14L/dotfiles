
- Add user to sudo group

```
/usr/sbin/usermod -aG sudo chris
```

- Remove preinstalled stuff

```
sudo apt remove thunderbird quassel quassel-data libreoffice-common libreoffice-core \
    libreoffice-base-core audacious audacious-plugins audacious-plugins-data \
    smplayer smplayer-l10n smplayer-themes smtube firefox-esr
sudo apt autoremove
```

- Install stuff

```
sudo apt install htop tig git curl wget rsync traceroute ffmpeg inkscape lxqt
curl -fsS https://dl.brave.com/install.sh | sh
```

- Install VPN

```
sudo apt install libayatana-appindicator3-1 gir1.2-ayatanaappindicator3-0.1
sudo dpkg -i Downloads/protonvpn-stable-release_1.0.8_all.deb
sudo apt update
sudo apt install proton-vpn-gnome-desktop
sudo dpkg-reconfigure network-manager
sudo systemctl restart NetworkManager
```

- Disable manual login on systems with encrypted SDD:

```
sudo mkdir -p /etc/sddm.conf.d
sudo nano /etc/sddm.conf.d/autologin.conf
    [Autologin]
    User=chris
    Session=lxqt.desktop
    Relogin=false
sudo dpkg-reconfigure sddm
```
