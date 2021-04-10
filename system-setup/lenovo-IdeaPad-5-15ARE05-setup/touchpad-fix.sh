#! /bin/sh
# Fix IdeaPad 5 15ARE05 Elan Touchscreen mouse
#   Linux: 20.04.1-Ubuntu: kernel 5.8.0-48-generic
#   Files are in the directory "lenovo-IdeaPad-5-15ARE05-setup"
cp touchpadfix.service /etc/systemd/system/touchpadfix.service
sudo cp touchpadfix /usr/local/bin/
sudo chmod +x /usr/local/bin/touchpadfix
sudo systemctl daemon-reload
sudo systemctl enable --now touchpadfix.service

