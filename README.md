# Meridix Launcher

A fast, clean Minecraft launcher for Mac, Windows, and Linux.

## Download and Install

### macOS

1. Download the latest `.dmg` from [Releases](https://github.com/yourusername/liquid_launcher/releases)
2. Open the DMG file
3. Drag "Meridix Launcher" to your Applications folder
4. Done - launch from Applications

### Windows

1. Download the latest `.zip` from [Releases](https://github.com/yourusername/liquid_launcher/releases)
2. Extract the folder to a location like `C:\Games\` or `C:\Program Files\`
3. Run `Meridix Launcher.exe`
4. Create a desktop shortcut if you want

### Linux

1. Download the latest `.tar.gz` from [Releases](https://github.com/yourusername/liquid_launcher/releases)
2. Extract: `tar -xzf Meridix-Launcher-Linux.tar.gz`
3. Run: `./Meridix\ Launcher`
4. Optional: add to your applications menu

## Getting Started

When you first launch the app:

1. Click "Sign In" to add your Microsoft account
2. Your browser will open briefly for login (same as mojang.com login)
3. You're done - your account is saved and encrypted
4. Create or import instances and play

## Features

- Sign in with your Microsoft/Xbox account
- Create instances for different Minecraft versions
- Install modloaders: Fabric, Forge, Quilt, NeoForge
- Download modpacks directly from Modrinth
- Search and install mods
- Per-instance settings: Java version, RAM allocation, JVM args
- Multi-account support
- View debug logs and game output

## Common Tasks

### Create a New Instance

1. Click "Instances" in the sidebar
2. Click "New Instance"
3. Pick your Minecraft version
4. Optional: select a modloader
5. Click Create
6. Instance appears in your list

### Install a Modpack

1. Click "Modpacks"
2. Browse and click install on a modpack
3. Pick a folder location
4. Wait for download and installation
5. Play the instance

### Change Per-Instance Settings

1. Click on an instance
2. Go to "Settings" tab
3. Adjust Java path, RAM, or JVM args
4. Save and play

### Add Multiple Accounts

1. Click "Accounts" in the sidebar
2. Click "Add Account"
3. Sign in with a different Microsoft account
4. Switch between accounts before launching

### View Logs

1. Click "Logs" in the sidebar
2. See real-time game output and launcher debug info
3. Helpful if something goes wrong

## Requirements

- macOS 11+ (Apple Silicon)
- Windows 10+ 
- Linux (Ubuntu 20.04+, Fedora 32+, etc.)
- Java 8+ (auto-detected or manually set)

## Settings

Available in the Settings tab:

- **Memory**: Minimum and maximum RAM for games (default: 512 MB - 4 GB)
- **Java**: Auto-detect or manually specify java executable
- **Custom Data Folder**: Store games somewhere other than the default location
- **Close on Launch**: Automatically close the launcher when you start a game

## Troubleshooting

### Account won't sign in
- Check your internet connection
- Make sure you're using your Microsoft/Xbox account, not Minecraft legacy account
- Try signing out and back in

### Game won't launch
- Open the Logs tab to see what went wrong
- Make sure you have Java installed: `java -version` in terminal
- Try increasing the allocated RAM in instance settings

### Can't find mods I'm looking for
- Click "Instances" then the instance
- Go to "Mods" tab
- Search for mods there (searches Modrinth)
- Make sure the mod version matches your MC version

### Storage issues
- Data is stored in a hidden folder:
  - macOS: `~/Library/Application Support/Meridix Launcher`
  - Windows: `%APPDATA%\Meridix Launcher`
  - Linux: `~/.meridix`
- You can change this in Settings under "Custom Data Folder"

## Known Issues

- macOS: Currently Apple Silicon only (arm64)
- Windows: Some antivirus may flag the launcher on first run (false positive)
- Linux: OAuth login may use external browser on some desktop environments

## Support

Found a bug? Have a suggestion? Open an issue on GitHub.

---

# For Developers

Want to build Meridix yourself or contribute? Read on.

## Prerequisites

- Flutter 3.10+
- Rust 1.70+
- Xcode (macOS) or Visual Studio Build Tools (Windows) or standard Linux dev tools

## Setup

Clone and install:
```bash
git clone https://github.com/yourusername/liquid_launcher.git
cd liquid_launcher
flutter pub get
cd rust_builder && flutter pub get && cd ..
```

## Building

macOS (arm64 only):
```bash
flutter build macos --release --target-arch=arm64
```

Windows:
```bash
flutter build windows --release
```

Linux:
```bash
flutter build linux --release
```

Output goes to `build/<platform>/release/`.

## Development

Run in debug mode:
```bash
flutter run -d macos
flutter run -d windows
flutter run -d linux
```

Hot reload works for Dart. Rust changes require rebuild.

## Architecture

UI Layer (Flutter with Riverpod state management)
  -> Domain Layer (Models, repositories)
  -> Rust FFI (Authentication, launching, installation)
  -> Platform Layer (macOS Swift, Windows C++, Linux C++)

## Project Structure

```
lib/
  features/         Each major feature in its own folder
    auth/
    instances/
    mods/
    remote_mods/
    downloads/
    settings/
    console/
  core/             Shared code
    platform/       File service, window management
    theme/          Design system
    providers/       Global state
  shell/            Main UI scaffold and routing

rust/
  src/
    api/
      auth.rs       OAuth and token chains
      launcher.rs   Game spawning
      installer.rs  Version/loader installation
      metadata.rs   Fetching available versions
    mc-launcher-core/  (external Minecraft logic crate)
```

## How It Works

Authentication: User signs in via WebView -> OAuth code captured -> MSA token -> Xbox Live -> XSTS -> Minecraft auth -> profile fetched and encrypted locally.

Game Launch: User clicks Play -> Dart collects settings -> Rust builds JVM command -> spawns process -> streams exit events -> UI updates.

Installation: Parse modpack metadata -> download files -> handle loader (Fabric writes profiles, Forge runs installer) -> save instance config.

## Releases

Push to main for dev builds. Tag a version to trigger full release:
```bash
git tag v1.0.0
git push origin v1.0.0
```

Builds all platforms automatically and creates GitHub Release.

See `.github/GITHUB_ACTIONS_SETUP.md` for details.

## Dependencies

Key packages: flutter_riverpod, go_router, dio, encrypt, flutter_rust_bridge, mc-launcher-core.

Full list in `pubspec.yaml`.

## Contributing

Submit issues and PRs. Keep Dart in feature folders, Rust in api module. Comments explain "why" not "how".

## License

MIT

## Questions?

Open an issue on GitHub.
