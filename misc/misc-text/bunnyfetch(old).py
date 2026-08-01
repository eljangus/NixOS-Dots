#!/usr/bin/env python3
"""
🐰 bunnyfetch — a fastfetch-like system info tool, but make it bunnies 🐰

Usage:
    python3 bunnyfetch.py
    chmod +x bunnyfetch.py && ./bunnyfetch.py

No external dependencies required (pure stdlib).
"""

import os
import platform
import shutil
import socket
import subprocess
import sys
import time
from datetime import timedelta

# ---------------------------------------------------------------------------
# 🎨 pastel palette (truecolor ANSI). Falls back gracefully on dumb terminals.
# ---------------------------------------------------------------------------

def _supports_color():
    if os.environ.get("NO_COLOR"):
        return False
    if not sys.stdout.isatty():
        return False
    return True

COLOR = _supports_color()

def rgb(r, g, b, text):
    if not COLOR:
        return text
    return f"\033[38;2;{r};{g};{b}m{text}\033[0m"

def bold(text):
    if not COLOR:
        return text
    return f"\033[1m{text}\033[0m"

PINK      = lambda t: rgb(255, 175, 204, t)
DEEP_PINK = lambda t: rgb(255, 110, 168, t)
LAVENDER  = lambda t: rgb(203, 178, 255, t)
CREAM     = lambda t: rgb(255, 240, 214, t)
MINT      = lambda t: rgb(178, 240, 210, t)
SKY       = lambda t: rgb(178, 220, 255, t)
GRAY      = lambda t: rgb(170, 170, 170, t)
PEACH     = lambda t: rgb(255, 200, 170, t)

LABEL_COLOR = DEEP_PINK
VALUE_COLOR = CREAM
BAR_FILLED  = PINK
BAR_EMPTY   = GRAY

# ---------------------------------------------------------------------------
# 🐇 the bunny herself
# ---------------------------------------------------------------------------

BUNNY_ART = r"""
       (\(\
       ( -.-)
      o_(")(")
"""

BUNNY_ART_LINES = [
    "       (\\(\\ ",
    "       ( -.-)",
    "      o_(\")(\")",
    "              ",
    "              ",
    "              ",
]

# ---------------------------------------------------------------------------
# 🥕 info gathering helpers
# ---------------------------------------------------------------------------

def run(cmd):
    try:
        out = subprocess.run(
            cmd, shell=True, capture_output=True, text=True, timeout=2
        )
        return out.stdout.strip()
    except Exception:
        return ""

def get_os_pretty_name():
    try:
        with open("/etc/os-release") as f:
            data = dict(
                line.strip().split("=", 1)
                for line in f
                if "=" in line and not line.startswith("#")
            )
        name = data.get("PRETTY_NAME", "").strip('"')
        if name:
            return name
    except Exception:
        pass
    return platform.system() + " " + platform.release()

def get_kernel():
    return platform.release()

def get_hostname():
    return socket.gethostname()

def get_username():
    return os.environ.get("USER") or os.environ.get("LOGNAME") or "bunny"

def get_uptime_str():
    try:
        with open("/proc/uptime") as f:
            seconds = float(f.readline().split()[0])
        td = timedelta(seconds=int(seconds))
        days = td.days
        hours, rem = divmod(td.seconds, 3600)
        minutes, _ = divmod(rem, 60)
        parts = []
        if days:
            parts.append(f"{days}d")
        if hours:
            parts.append(f"{hours}h")
        parts.append(f"{minutes}m")
        return " ".join(parts)
    except Exception:
        return "unknown"

def get_shell():
    shell = os.environ.get("SHELL", "unknown")
    return os.path.basename(shell) if shell != "unknown" else shell

def get_terminal():
    return (
        os.environ.get("TERM_PROGRAM")
        or os.environ.get("TERM")
        or "unknown"
    )

def get_cpu():
    try:
        with open("/proc/cpuinfo") as f:
            for line in f:
                if line.startswith("model name"):
                    return line.split(":", 1)[1].strip()
    except Exception:
        pass
    return platform.processor() or "unknown burrow chip"

def get_cpu_count():
    return os.cpu_count() or 1

def get_memory():
    """Returns (used_mb, total_mb) using /proc/meminfo."""
    try:
        meminfo = {}
        with open("/proc/meminfo") as f:
            for line in f:
                parts = line.split(":")
                if len(parts) == 2:
                    key = parts[0].strip()
                    val = int(parts[1].strip().split()[0])  # kB
                    meminfo[key] = val
        total_kb = meminfo.get("MemTotal", 0)
        avail_kb = meminfo.get("MemAvailable", meminfo.get("MemFree", 0))
        used_kb = total_kb - avail_kb
        return used_kb / 1024, total_kb / 1024
    except Exception:
        return 0, 0

def get_disk():
    try:
        total, used, free = shutil.disk_usage("/")
        return used / (1024**3), total / (1024**3)
    except Exception:
        return 0, 0

def get_package_count():
    """Best-effort 'carrot count' — number of installed packages."""
    managers = [
        ("dpkg-query -f '.' -W 2>/dev/null | wc -c", "dpkg"),
        ("rpm -qa 2>/dev/null | wc -l", "rpm"),
        ("pacman -Qq 2>/dev/null | wc -l", "pacman"),
        ("apk info 2>/dev/null | wc -l", "apk"),
        ("xbps-query -l 2>/dev/null | wc -l", "xbps"),
        ("flatpak list 2>/dev/null | wc -l", "flatpak"),
    ]
    for cmd, name in managers:
        out = run(cmd)
        if out.isdigit() and int(out) > 0:
            return f"{out} ({name})"
    return "some, probably"

def get_resolution():
    out = run("xrandr --current 2>/dev/null | grep '*' | awk '{print $1}'")
    if out:
        return out.splitlines()[0]
    return "unknown"

def get_de():
    return (
        os.environ.get("XDG_CURRENT_DESKTOP")
        or os.environ.get("DESKTOP_SESSION")
        or "none (headless warren)"
    )

# ---------------------------------------------------------------------------
# 🌸 formatting helpers
# ---------------------------------------------------------------------------

def make_bar(pct, width=18):
    filled = int(round(width * pct / 100))
    filled = max(0, min(width, filled))
    bar = "●" * filled + "○" * (width - filled)
    return BAR_FILLED(bar[:filled]) + BAR_EMPTY(bar[filled:])

def fluff_meter_label(pct):
    if pct < 20:
        return "practically empty burrow"
    elif pct < 40:
        return "light and fluffy"
    elif pct < 60:
        return "cozy fluff levels"
    elif pct < 80:
        return "getting quite plush"
    elif pct < 95:
        return "maximum fluff!"
    else:
        return "bursting with fluff!! 🐇"

def hearts(n=3):
    return PINK("♥ " * n).rstrip()

def label(text, width=20):
    """Pad label text to a fixed width BEFORE colorizing, so ANSI codes
    don't throw off alignment."""
    return LABEL_COLOR(f"{text:<{width}}")

# ---------------------------------------------------------------------------
# 🎀 main render
# ---------------------------------------------------------------------------

def main():
    user = get_username()
    host = get_hostname()
    os_name = get_os_pretty_name()
    kernel = get_kernel()
    uptime = get_uptime_str()
    shell = get_shell()
    terminal = get_terminal()
    cpu = get_cpu()
    cpu_count = get_cpu_count()
    used_mem, total_mem = get_memory()
    used_disk, total_disk = get_disk()
    packages = get_package_count()
    de = get_de()

    mem_pct = (used_mem / total_mem * 100) if total_mem else 0
    disk_pct = (used_disk / total_disk * 100) if total_disk else 0

    title = f"{user}@{host}"
    underline = "─" * len(title)

    lines = []
    lines.append(f"{LABEL_COLOR(bold(title))}")
    lines.append(f"{GRAY(underline)}")
    lines.append(f"{label('Burrow OS')} {VALUE_COLOR(os_name)}")
    lines.append(f"{label('Warren kernel')} {VALUE_COLOR(kernel)}")
    lines.append(f"{label('Hop time')} {VALUE_COLOR(uptime)}")
    lines.append(f"{label('Carrot stash')} {VALUE_COLOR(packages)}")
    lines.append(f"{label('Burrow shell')} {VALUE_COLOR(shell)}")
    lines.append(f"{label('Cozy den (DE)')} {VALUE_COLOR(de)}")
    lines.append(f"{label('Whisker terminal')} {VALUE_COLOR(terminal)}")
    lines.append(f"{label('Bunny brain (CPU)')} {VALUE_COLOR(cpu)} {GRAY(f'({cpu_count} paws)')}")
    lines.append(
        f"{label('Fluff level (RAM)')} "
        f"{make_bar(mem_pct)} {VALUE_COLOR(f'{mem_pct:.0f}%')} "
        f"{GRAY(f'({used_mem/1024:.1f}GiB / {total_mem/1024:.1f}GiB)')}"
    )
    lines.append(
        f"{label('Nibble note')} {VALUE_COLOR(fluff_meter_label(mem_pct))}"
    )
    lines.append(
        f"{label('Burrow space (disk)')} "
        f"{make_bar(disk_pct)} {VALUE_COLOR(f'{disk_pct:.0f}%')} "
        f"{GRAY(f'({used_disk:.1f}GiB / {total_disk:.1f}GiB)')}"
    )
    lines.append("")
    lines.append(hearts(4))

    # pastel color swatch row, bunny-fied
    swatches = [PINK("●"), DEEP_PINK("●"), LAVENDER("●"), CREAM("●"), MINT("●"), SKY("●"), PEACH("●")]
    lines.append(" ".join(swatches))

    # combine bunny art (left) with info (right).
    # Pad the PLAIN text to a fixed width first, then colorize — this keeps
    # alignment correct even though ANSI escape codes add invisible bytes.
    art = BUNNY_ART_LINES
    max_art_width = max(len(l) for l in art) + 4

    out = []
    for i in range(max(len(art), len(lines))):
        art_line = art[i] if i < len(art) else ""
        info_line = lines[i] if i < len(lines) else ""
        padded_art = f"{art_line:<{max_art_width}}"
        out.append(f"{PINK(padded_art)}{info_line}")

    print()
    for line in out:
        print(line)
    print()

if __name__ == "__main__":
    main()
