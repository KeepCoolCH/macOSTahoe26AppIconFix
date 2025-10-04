# 🎨 macOS Tahoe 26 App Icon Fix

**Refresh and re-apply existing macOS App icons** using [`fileicon`](https://github.com/mklement0/fileicon).  
Developed by **Kevin Tobler** – 🌐 [www.kevintobler.ch](https://www.kevintobler.ch)

---

## 🧩 Overview

This script automatically **refreshes all app icons** located in `/Applications` on **macOS Tahoe 26**.  
It checks each `.app` bundle and re-links its icon using the command-line utility `fileicon`.

Useful when:
- Finder icons appear **blank** or **don’t update properly**
- You’ve **manually replaced** app icons and they’re not displaying
- After **system upgrades** or **cache resets**

---

## ⚙️ Requirements

- **macOS Tahoe 26**
- **Terminal access**  
- **Homebrew** installed  
- **fileicon** utility installed  

---

## 🧭 Installation

1. **Install Homebrew (if not already installed):**
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install fileicon via Homebrew:**
   ```bash
   brew install fileicon
   ```

3. **Download or copy this script**  
   Save it as: `macOS_Tahoe_AppIconFix.sh`

4. **Make it executable (optional):**
   ```bash
   chmod +x macOS_Tahoe_AppIconFix.sh
   ```

---

## ▶️ Usage

Run the script with **sudo** (required for modifying app icons):

```bash
sudo zsh macOS_Tahoe_AppIconFix.sh
```

Then enter your password when prompted.

---

## 🪄 What It Does

- Checks for `fileicon` binary (Apple Silicon `/opt/homebrew` or Intel `/usr/local`)
- Scans `/Applications` for all `.app` bundles
- For each app:
  - If a custom icon exists, it is **refreshed** (extracted and re-set)
  - If no icon is linked, it **re-applies the default app icon**
- Finally, **restarts Finder** to show updated icons

---

## 💡 Example Output

```
🎨 Refreshing already linked App icons ...
🔧 Safari.app
♻️ refreshed existing icon
🔧 Mail.app
✨ re-applied default icon
🔧 GarageBand.app
⚠️ no icon found
🔄 Reloading Finder...
✅ Done!
```

---

## 🧹 Troubleshooting

**fileicon not found:**  
Run:
```bash
brew install fileicon
```

**Finder icons still not updated:**  
Try manually relaunching Finder:
```bash
killall Finder
```

**Some apps skipped:**  
System-protected apps may not allow icon changes (e.g., Safari, Mail).

---

## 🧑‍💻 Author

**Kevin Tobler**  
🌐 [www.kevintobler.ch](https://www.kevintobler.ch)  
📦 macOS Tahoe 26 App Icon Fix

> “Because a refreshed Mac deserves refreshed icons.” ✨

---

## 🪪 License

MIT License – You’re free to use, modify, and share this script.  
Attribution appreciated 🙌
