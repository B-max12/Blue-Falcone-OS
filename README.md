# 🇵🇰 Taleem OS — Pakistan's First Educational Operating System

<p align="center">
  <strong>Empowering Pakistani Students to Learn Safely</strong><br>
  <em>A Linux-based educational OS with Urdu support, parental controls, and safe browsing</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Base-Ubuntu%2024.04%20LTS-E95420?style=for-the-badge&logo=ubuntu&logoColor=white" alt="Ubuntu 24.04">
  <img src="https://img.shields.io/badge/Status-Alpha-yellow?style=for-the-badge" alt="Alpha">
  <img src="https://img.shields.io/badge/License-GPLv3-blue?style=for-the-badge" alt="License">
  <img src="https://img.shields.io/badge/Target-Ages%205--18-green?style=for-the-badge" alt="Target Ages 5-18">
</p>

---

## 🎯 What is Taleem OS?

**Taleem OS** (تعلیم او ایس) is a customized Linux distribution built for Pakistani students aged 5–18. It provides a safe, Urdu-friendly, and distraction-free learning environment with built-in parental controls and curated educational content.

> **"Taleem"** (تعلیم) means **"Education"** in Urdu.

## ✨ Key Features

| Feature | Description |
|---------|-------------|
| 🌐 **Urdu First** | Full Urdu language support with Nastaliq fonts and Urdu keyboard |
| 🛡️ **Safe Browsing** | AI-powered content filtering with age-appropriate modes |
| 👨‍👩‍👧 **Parental Controls** | Time limits, app restrictions, activity monitoring dashboard |
| 📚 **Education Suite** | Pre-installed tools for Math, Science, Coding, and Islamic Studies |
| 🎨 **Pakistani Branding** | Custom themes, wallpapers, and sounds celebrating Pakistani culture |
| ⚡ **Lightweight** | Runs on low-spec hardware (2GB RAM, older processors) |

## 🏗️ Architecture Overview

```
┌─────────────────────────────────────────────────┐
│                  Taleem OS                       │
├──────────┬──────────┬──────────┬────────────────┤
│  Urdu    │  Safe    │ Parental │  Educational   │
│ Support  │ Browser  │ Controls │  Content       │
├──────────┴──────────┴──────────┴────────────────┤
│              Custom Ubuntu Desktop               │
├─────────────────────────────────────────────────┤
│              Ubuntu 24.04 LTS Base               │
├─────────────────────────────────────────────────┤
│                Linux Kernel 6.x                  │
└─────────────────────────────────────────────────┘
```

## 🚀 Quick Start

### Prerequisites

- **Windows 11** with [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) installed
- At least **8GB RAM** and **50GB free disk space**
- Internet connection for downloading Ubuntu base

### Setup Development Environment

```bash
# 1. Clone the repository
git clone https://github.com/your-username/taleem-os.git
cd taleem-os

# 2. (In WSL2) Install development tools
chmod +x scripts/setup-dev.sh
./scripts/setup-dev.sh

# 3. Build the ISO
make build-iso

# 4. Test in virtual machine
make test-vm
```

## 📁 Project Structure

```
taleem-os/
├── config/          # Configuration files
├── scripts/         # Build and setup scripts
├── src/
│   ├── branding/        # Logos, wallpapers, themes
│   ├── packages/        # Custom .deb packages
│   ├── content-filter/  # Safe browsing module
│   ├── parental-controls/ # Parental control system
│   ├── urdu-support/    # Urdu language integration
│   └── installer/       # Custom installer configs
├── iso/             # ISO build workspace (gitignored)
├── tests/           # Test suite
└── docs/            # Documentation
```

## 🎓 User Modes

| Mode | Ages | Description |
|------|------|-------------|
| 🛡️ **Guardian** | 5–9 | Maximum safety, only whitelisted content |
| 📖 **Guided** | 10–14 | Moderate filtering, educational freedom |
| 🎓 **Scholar** | 15–18 | Light filtering, research access |

## 🗺️ Roadmap

- [x] **Week 1** — Development environment setup
- [ ] **Week 2-4** — Ubuntu customization + Urdu support
- [ ] **Month 2** — Safe browsing / content filter
- [ ] **Month 3** — Parental controls + dashboard
- [ ] **Month 4** — Educational content integration
- [ ] **Month 5** — Pakistani branding + themes
- [ ] **Month 6** — Testing, polish, alpha release

## 🤝 Contributing

We welcome contributions! See [docs/contributing.md](docs/contributing.md) for guidelines.

## 📄 License

This project is licensed under the **GNU General Public License v3.0** — see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Ubuntu community for the amazing base distribution
- Pakistani open-source community
- All teachers and parents who inspired this project

---

<p align="center">
  <strong>Built with ❤️ for Pakistan's future 🇵🇰</strong><br>
  <em>پاکستان کے مستقبل کے لیے محبت سے بنایا گیا</em>
</p>
