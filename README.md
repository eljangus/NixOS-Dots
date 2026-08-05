# ❄️ nixos

<div align="center">

**NixOS · Niri · Noctalia** — three desktops, one flake, zero regrets.

![nixos](https://img.shields.io/badge/NixOS-5277C3?logo=nixos&logoColor=fff)
![niri](https://img.shields.io/badge/niri-1D1D1D?logo=hyprland&logoColor=fff)
![plasma](https://img.shields.io/badge/Plasma%206-0078D7?logo=linux&logoColor=fff)
![gnome](https://img.shields.io/badge/GNOME-4A86CF?logo=gnome&logoColor=fff)
![mit](https://img.shields.io/badge/license-MIT-blue)

</div>

My NixOS configuration. One machine, three systems, one module tree — with a
nix-darwin branch growing on the side.

Application dotfiles (niri, noctalia, fastfetch, kitty) are managed imperatively
and live [here](https://github.com/eljangus/dotfiles).

<div align="center">

## ❄️ NixOS · Niri · Noctalia

**My main NNN-stack configuration** - using `wc` as the host.

![ss1](./assets/screenshots/1.png) ![ss2](./assets/screenshots/2.png)

</div>

## ✨ Highlights

- **One flake, three desktops** — Niri, Plasma 6 and GNOME all build the same
  machine, `Apollo`; pick one with a single flag.
- **A platform split that's structural** — shared modules physically avoid
  NixOS-only options, so the same tree also evaluates as nix-darwin.
- **Pinned by [tack](https://github.com/manic-systems/tack)** — `.tack/pins.toml`
  is the source of truth, `nix flake update` does nothing.
- **Opt-in everything** — overlays (`glaze`, `swash`, `qt6ct-kde`,
  `sddm-astronaut`), gamescope, gpu-screen-recorder and friends stay off until a
  host switches them on.

## 🖥️ Hosts

All three build the same machine, `Apollo`, with a different desktop and user:

| Host    | User      | Desktop  |
| ------- | --------- | -------- |
| `wc`    | `elias`   | Niri     |
| `kde`   | `kdelias` | Plasma 6 |
| `gnome` | `gelias`  | GNOME    |

```bash
nh os switch .#wc
nh os switch .#kde
nh os switch .#gnome
```

`darwinConfigurations.mac` exists in the flake but integrating nix-darwin is
still a WIP.

## 🗂️ Layout

```
.
├── assets
│   └── screenshots
│       ├── 1.png
│       └── 2.png
├── hosts
│   ├── gnome
│   │   ├── default.nix
│   │   ├── modules.nix
│   │   └── pkgs.nix
│   ├── kde
│   │   ├── default.nix
│   │   ├── modules.nix
│   │   └── pkgs.nix
│   ├── mac
│   │   └── default.nix
│   └── wc
│       ├── default.nix
│       ├── modules.nix
│       └── pkgs.nix
├── lib
│   ├── import-tree.nix
│   └── mk-user.nix
├── modules
│   ├── common
│   │   ├── programs
│   │   │   ├── common-pkgs.nix
│   │   │   └── fish.nix
│   │   ├── system
│   │   │   ├── fonts.nix
│   │   │   ├── nix.nix
│   │   │   └── time.nix
│   │   ├── default.nix
│   │   └── options.nix
│   ├── darwin
│   │   └── default.nix
│   ├── home-manager
│   │   ├── common-programs
│   │   │   ├── default.nix
│   │   │   ├── fish.nix
│   │   │   ├── git.nix
│   │   │   ├── man.nix
│   │   │   ├── nh-darwin.nix
│   │   │   ├── nvf.nix
│   │   │   └── starship.nix
│   │   ├── elias
│   │   │   ├── default.nix
│   │   │   └── xdg.nix
│   │   └── melias
│   │       └── default.nix
│   └── nixos
│       ├── programs
│       │   ├── dconf.nix
│       │   ├── desktop-pkgs.nix
│       │   ├── firefox.nix
│       │   ├── gamescope.nix
│       │   ├── gpu-screen-recorder.nix
│       │   ├── nh.nix
│       │   ├── steam.nix
│       │   └── tack.nix
│       ├── system
│       │   ├── desktops
│       │   │   ├── gnome.nix
│       │   │   ├── hyprland.nix
│       │   │   ├── niri.nix
│       │   │   ├── plasma6.nix
│       │   │   └── sddm.nix
│       │   ├── overlays
│       │   │   ├── glaze.nix
│       │   │   ├── qt6ct-kde.nix
│       │   │   ├── sddm-astronaut.nix
│       │   │   └── swash.nix
│       │   ├── amdgpu.nix
│       │   ├── boot.nix
│       │   ├── environment.nix
│       │   ├── hardware.nix
│       │   ├── locale.nix
│       │   ├── openssh.nix
│       │   ├── polkit.nix
│       │   ├── services.nix
│       │   └── xkb.nix
│       ├── default.nix
│       └── options.nix
├── patches
│   └── qt6ct-shenanigans.patch
├── systems
│   ├── Apollo
│   │   ├── default.nix
│   │   ├── hardware-configuration.nix
│   │   ├── modules.nix
│   │   └── networking.nix
│   └── Mac
│       ├── default.nix
│       └── modules.nix
├── .tack
│   ├── default.nix
│   ├── pins.lock.json
│   └── pins.toml
└── flake.nix
```

## 🧠 Conventions

### The platform split is structural

`modules/common` is imported by both `nixosSystem` and `darwinSystem`;
`modules/nixos` and `modules/darwin` only by their own. This is not a stylistic
choice, `lib.mkIf` does not protect against options that do not exist. The
module system pushes the condition down to the leaves _before_ checking option
paths, so a disabled `mkIf false { boot.loader… = …; }` still registers `boot`
as a defined attribute and nix-darwin will reject it. A module touching a
NixOS-only option therefore has to be physically absent from the Darwin
evaluation, not merely switched off.

Rule of thumb for where a new module goes: if every option path it writes to
exists in both NixOS and nix-darwin **and** every package it pulls in builds on
both, it belongs in `common`. Otherwise `nixos` (or `darwin`).

Cross-platform user-level things: git, nvf and starship live in
`modules/home-manager` instead, which sidesteps the question entirely.

### Options

Modules are toggled through a single option namespace, declared in
`modules/common/options.nix` for the shared modules and
`modules/nixos/options.nix` for the Linux-only ones:

```nix
# example
myModules = {
  desktop = "niri";
  system.overlays.enable = true;
  programs.gpu-screen-recorder.enable = true;
};
```

Every module is one `lib.mkIf` guarded on its own option, with nothing outside
the guard. Most default to on; `gamescope`, `gpu-screen-recorder`, `openrgb`,
`polkit`, `udev` and the overlays are opt-in and get switched on per host in
`hosts/*/modules.nix` or `systems/Apollo/modules.nix`.

### Adding a module

`lib/import-tree.nix` imports each directory recursively, skipping `default.nix`
and any file prefixed with `_`, so a new module is a new file plus its option
declaration in the matching `options.nix`.

### Users

`lib/mk-user.nix` produces both the system account and the home-manager config
from a name and a host. Darwin differences (home under `/Users`, no
`isNormalUser`, `nh darwin` instead of `nh os`) are handled inside it.

### Inputs

Pinned with [tack](https://github.com/manic-systems/tack), so `.tack/pins.toml`
is the source of truth and `nix flake update` does nothing. `tack update`
refreshes the lock.

## 🚀 Using it

Tailored to my hardware. To get going, a quick try on a matching box:

```bash
# switch desktop of choice
nh os switch .#wc     # Niri      (user: elias)
nh os switch .#kde    # Plasma 6  (user: kdelias)
nh os switch .#gnome  # GNOME     (user: gelias)
```

<details>
<summary>First-time setup checklist</summary>

- Replace `systems/Apollo/hardware-configuration.nix` with your own.
- Review `systems/Apollo/modules.nix` for hardware-specific modules.
- Set your name and email in `modules/home-manager/common-programs/git.nix`.
- Place hashed password files at `/etc/nixos/secrets/<user>.txt`.

</details>

## 📄 License

[MIT](LICENSE). Do what you like.
