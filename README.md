# Image Toolkit

A simple Windows app to **resize/convert images** and **merge images or PDFs**.

## What it does

**Convert & Resize tab**
- Batch-convert images to JPG, PNG, WEBP, BMP, TIFF, or PDF.
- Resize by **dimensions** (width/height, keep aspect ratio optional).
- Resize by **target file size** (e.g. "make it fit under 500 KB").

**Merge tab**
- Combine several **images into one PDF**.
- **Merge multiple PDFs** into one.
- Stack **images into one long image** (vertical or horizontal).

**Split PDF tab**
- Split a PDF into **one file per page**.
- **Extract a page range** (e.g. pages 3–7) into a new PDF.
- **Split every N pages** into separate files.

**All tabs**
- **Drag and drop** files straight onto the list, or use the "Add files" button.
- Custom app icon on the window, taskbar, and installed app.

---

## How to use it — pick one option

### Option 1 — Standalone .exe (recommended, no installer)
1. Install Python 3 from https://www.python.org/downloads/ and **tick "Add python.exe to PATH"** during install.
2. Double-click **`build.bat`**.
3. When it finishes, your standalone app is at **`dist\ImageToolkit.exe`**. Double-click to run, or copy that single file anywhere — no Python needed to run it, no installation.

### Option 2 — Just run it (no build)
1. Do step 1 above (install Python).
2. Double-click **`run_from_source.bat`**. It installs the required libraries and opens the app.

### Optional — Make an installer
Only if you later want a Start-menu/desktop shortcut: do Option 1, install **Inno Setup** (free, https://jrsoftware.org/isdl.php), open **`installer.iss`**, and click **Compile**. Not required for the standalone app.

> Note: the `.exe` must be built on Windows (Option 1). It can't be produced on this Linux build sandbox, which is why you run `build.bat` on your PC — it takes about a minute.

---

## Share it with other people (minimal setup for them)

However you build it, other people only ever need the single **`ImageToolkit.exe`** —
they double-click it, no Python and no install. Two ways to produce that file:

- **Cloud (recommended):** a free Windows server builds it for you and gives you a
  download link to share. Follow **`PUBLISH_GUIDE.md`** (website only, no commands).
- **Local:** run **`build.bat`** once on your PC, then send the resulting
  `dist\ImageToolkit.exe` to anyone.

Send **`SHARE_READ_ME_FIRST.txt`** along with the app so recipients know about the
one-time Windows "Run anyway" security prompt.

## Project layout

```
ImageToolkit/
  src/
    main.py          GUI (tabs, buttons, file pickers, drag-and-drop)
    image_ops.py     resize + convert logic
    merge_ops.py     merge logic (PDF / images)
    split_ops.py     split-PDF logic
  assets/
    app.ico          custom app icon
    app.png          icon preview
  generate_icon.py   rebuilds the icon
  requirements.txt   libraries used (Pillow, pypdf, tkinterdnd2)
  run_from_source.bat  Option 1
  build.bat            Option 2
  installer.iss        Option 3
  CHANGELOG.md       version history
  VERSION            current version number
```

## Version control

Full history is provided as a portable git bundle: **`ImageToolkit-repo.bundle`** (tagged `v1.1.0`).
To get a proper working git repo on your PC:

1. Install Git from https://git-scm.com/download/win.
2. Open a terminal wherever you want the project, and run:
   `git clone ImageToolkit-repo.bundle ImageToolkit`
3. That gives you the full project with history. From then on, save versions with
   `git add -A` then `git commit -m "your note"`.

Note: a live `.git` folder can't run inside this synced/cloud folder, so use the bundle above (or just delete any leftover `.git` folder here and run `git init` fresh).

## Requirements

- Windows 10 or 11.
- Python 3.9+ (only for Options 1 and 2; the installed .exe from Option 3 needs no Python).
