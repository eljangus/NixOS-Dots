<div align="center">

# ❄️ NixOS · Niri · Noctalia

**My personal NNN-stack dotfiles** — a declarative, reproducible Wayland desktop
built on [NixOS](https://nixos.org), [Niri](https://github.com/YaLTeR/niri), and [Noctalia Shell](https://noctalia.dev).

<!-- Place your screenshot at misc/images/screenshot.png in the repo (or update the filename below) -->
![Desktop Screenshot 1](../misc/images/1.png)
![Desktop Screenshot 2](../misc/images/2.png)

</div>

---

## ✨ Overview

This repository is my daily-driver NixOS configuration, managed using a flake.
One `nh os switch` gets the whole system — window manager, shell,
theming, and applications — into a known, reproducible state.

| Component        | Role                                                       |
|------------------|------------------------------------------------------------|
| **NixOS**        | Declarative OS, atomic upgrades, rollbacks                 |
| **Niri**         | Scrollable-tiling Wayland compositor                       |
| **Noctalia**     | OpenGL-based bar, launcher, notifications & lockscreen     |
| **Home Manager** | Per-user dotfile & app configuration                       |

---

## 🖥️ Features

- 🧩 Fully declarative system + (partly) user configuration via flakes and home-manager
- 🌀 Scrollable tiling with Niri — no floating chaos, no master/stack layout
- 🌙 Cohesive theme tying bar, launcher, notifications, and lockscreen together via Noctalia
- 🎨 Consistent theming across GTK/Qt app
- 📦 Modular structure — hosts, users, and shared modules kept separate
- 🔁 Reproducible: clone it on new hardware and boot the same desktop

---

## 📁 Structure

```
.
├── dotfiles
│   ├── gnome-dots
│   ├── kde-dots
│   └── wc-dots
├── misc
│   ├── images
│   │   ├── DANCs48XcAIsP6j.jpg
│   │   ├── nixos.svg
│   │   ├── NixOS.svg
│   │   ├── r7OyEq1.jpg
│   │   └── screenshots
│   │       ├── 1.png
│   │       └── 2.png
│   ├── misc-text
│   │   └── LaunchCommandsSteam
│   └── settings
│       ├── noctalia-vscode-buttons.sh
│       ├── settings.json
│       └── settings.toml
├── nixos
│   ├── flake.lock
│   ├── flake.nix
│   ├── home-modules
│   │   ├── common
│   │   │   └── common-home.nix
│   │   ├── elias.nix
│   │   ├── gelias.nix
│   │   └── kdelias.nix
│   ├── modules
│   │   └── hosts
│   │       ├── gnome-btw.nix
│   │       ├── kde-btw.nix
│   │       └── wc-btw.nix
│   ├── patches
│   │   └── qt6ct-shenanigans.patch
│   └── system
│       ├── hardware-configuration.nix
│       └── system.nix
└── README.md

```

---

## 🚀 Installation

> ⚠️ This config is tailored to my hardware. You'll need to edit hardware-specific
> options before using it as-is, furthermore you will need to generated the hashed passwords tied to specific users into /etc/nixos.

```bash
# Clone the repo
git clone https://codeberg.org/eljangus/NixOS-Dots.git
cd NixOS-Dots

# Review and edit hardware-configuration.nix and host settings for your machine

# Rebuild
nh os switch .#<hostname>
```

---

## ⌨️ Important Keybindings for Niri and Hyprland

| Keybind         | Action                   |
|-----------------|--------------------------|
| `Mod + Q`       | Open terminal            |
| `Mod + R`       | App launcher (Noctalia)  |
| `Mod + C`       | Close window             |
| `Mod + Scroll`  | Navigate workspaces      |

---

## 🙏 Credits

- [NixOS](https://nixos.org) — the declarative OS that makes this possible
- [Niri](https://github.com/YaLTeR/niri) — scrollable-tiling Wayland compositor
- [Noctalia Shell](https://noctalia.dev) — the desktop shell tying it all together
- [Noctalia Discord](https://discord.noctalia.dev/) - the people in the discord are super helpful and friendly and have inspired a me a lot in the creation of this setup
- Everyone in the NNN-stack community whose configs inspired parts of this one

---

## 📄 License

No license, use at your own risk.

