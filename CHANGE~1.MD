# Changelog

All notable changes to Image Toolkit are recorded here.
Format follows [Keep a Changelog](https://keepachangelog.com/).

## [1.4.0] - 2026-08-09

### Added
- Web version (`docs/index.html`): a single-page browser app with the same tools — Convert & Resize, Merge (images→PDF, merge PDFs, stack images), and Split PDF. Runs 100% client-side (pdf-lib + JSZip + Canvas); files never leave the visitor's device.
- `WEBSITE_GUIDE.md`: steps to turn on free GitHub Pages hosting and get a public link.
- Batch image conversion downloads as a ZIP; split outputs (per-page / every-N) download as a ZIP.

### Notes
- In-browser image output is JPG/PNG/WEBP (BMP/TIFF are desktop-only).

## [1.3.0] - 2026-08-07

### Added
- Cloud build: `.github/workflows/build-windows.yml` builds `ImageToolkit.exe` on a Windows server for every change, and publishes it to a shareable Releases page on version tags. No local build required to distribute.
- `PUBLISH_GUIDE.md`: no-command, website-only steps to set up the cloud build and get a download link.
- `SHARE_READ_ME_FIRST.txt`: a short file to send to recipients alongside the app.

## [1.2.3] - 2026-08-07

### Fixed
- Build error `Unable to find ...\ImageToolkitBuild\assets\app.ico when adding binary and data files`. Removed `--specpath` (which made data-file paths resolve against the temp folder) and switched the icon/data/script to absolute paths, while still building output to the local temp folder.

## [1.2.2] - 2026-08-07

### Fixed
- Build failure `win32ctypes ... EndUpdateResourceW (122) The data area passed to a system call is too small` caused by cloud-sync touching the .exe during icon embedding. `build.bat` now builds in a local temp folder (`%TEMP%\ImageToolkitBuild`) and copies the finished app back, avoiding the synced folder during the write.

## [1.2.1] - 2026-08-07

### Changed
- `build.bat` is now one-click: checks for Python, builds the standalone .exe, copies it to the Desktop, and opens the output folder. Friendly error messages that pause instead of flashing away.

## [1.2.0] - 2026-08-04

### Added
- New **Split PDF** tab with three modes: one PDF per page, extract a page range, and split every N pages.
- Split tab shows the PDF's page count and auto-fills the range end; supports drag-and-drop of a PDF.
- `src/split_ops.py` module with validation for bad page ranges.

## [1.1.0] - 2026-07-23

### Added
- Custom app icon (`assets/app.ico`), shown on the window, taskbar, and the built .exe/installer. Regenerate any time with `python generate_icon.py`.
- Drag-and-drop: drop image or PDF files straight onto either file list (via tkinterdnd2). Falls back gracefully to the "Add files" button if the library is missing.

### Changed
- `build.bat` now embeds the icon and bundles tkinterdnd2 into the standalone .exe.
- `installer.iss` uses the custom icon for the setup file.

## [1.0.0] - 2026-07-23

### Added
- Convert & Resize tab: batch-convert images to JPG, PNG, WEBP, BMP, TIFF, PDF.
- Resize by dimensions (with keep-aspect-ratio option).
- Resize by target file size in KB (compresses/downscales to fit).
- Merge tab: images to a single PDF, merge multiple PDFs, images to one long image (vertical or horizontal).
- Progress bar and status feedback; batch processing runs on a background thread.
- Packaging: `build.bat` (PyInstaller standalone .exe) and `installer.iss` (Inno Setup installer).
- `run_from_source.bat` to launch without building.
