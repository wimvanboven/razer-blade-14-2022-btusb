# razer-blade-14-2022-btusb
Bluetooth patch for the 2022 Razer Blade 14
tested and compiled on fedora 36

# install
```
sudo dnf install dkms
git clone https://github.com/wimvanboven/razer-blade-14-2022-btusb
cp -r razer-blade-14-2022-btusb/btusb-0.8 /usr/src
sudo dkms install btusb/0.8
```
