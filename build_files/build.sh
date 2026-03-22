#!/bin/bash

set -ouex pipefail

dnf5 install -y \
    btop \
    intel-gpu-tools \
    libva-utils \
    lsscsi \
    progress \
    smartmontools \
    tree \
    zip \
    unzip

# Install CoolerControl
dnf5 -y copr enable codifryed/CoolerControl
dnf5 -y install \
    coolercontrol \
    coolercontrold
dnf5 -y copr disable codifryed/CoolerControl
systemctl enable coolercontrold.service
