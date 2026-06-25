# My Chocolatey Packages

This repository contains my personal [Chocolatey](https://chocolatey.org) packages for the Chocolatey Community Repository.

## 📦 Available Packages

| Package                        | Version      | Description                                      | Status |
|-------------------------------|--------------|--------------------------------------------------|--------|
| [anycubic-photon-workshop](automatic/anycubic-photon-workshop) | 4.1.7 | Official slicer for Anycubic Photon resin printers | ✅ |
| [anycubic-slicer-next](automatic/anycubic-slicer-next) | 1.4.1.2 | Anycubic Slicer Next (Orca Version) | ✅ |
| [bloody-workshop](automatic/bloody-workshop) | 2026.0615 | Official software for Bloody gaming mice/keyboards | ✅ |
| [creality-scan](automatic/creality-scan) | 4.2.2 | 3D Scanning software by Creality | ✅ |
| [elegoo-satellite](automatic/elegoo-satellite) | 1.0.2.22 | ELEGOO SatelLite 3D Slicer | ✅ |
| [elegoo-slicer](automatic/elegoo-slicer) | 1.5.2.2 | Official Elegoo Slicer | ✅ |
| [zed-core](automatic/zed-core) | 1.8.2 | High-performance code editor (Zed) | ✅ |

## 🚀 How to Install

You can install any package using Chocolatey:

```powershell
choco install PACKAGE_NAME -y
```

Example:

```powershell
choco install zed-core -y
choco install bloody-workshop -y
```

## 📋 Automatic Updates

All packages support **automatic updates** via Chocolatey-AU.

## 🛠️ Repository Structure

```text
chocolatey-packages/
├── automatic/          # All automatic packages
│   ├── zed-core/
│   ├── elegoo-slicer/
│   └── ...
├── manual/             # (optional) Manual packages
└── README.md
```

## 📬 Contact & Issues

- GitHub Issues: [Create new issue](https://github.com/sanikovich/chocolatey-packages/issues)
- Chocolatey Profile: [sanikovich](https://community.chocolatey.org/profiles/sanikovich)
