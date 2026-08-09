# Put the tool online as a free website

The web version lives in the **`docs`** folder (`docs/index.html`). It runs entirely
in the visitor's browser — no server, no uploads, files stay on their device.
GitHub can host it for free from the repo you already made.

## Turn it on (one time, ~2 minutes)

1. Make sure the `docs` folder has been uploaded to your repo (it's part of the
   ImageToolkit folder — same upload as before).
2. In your repository, click **Settings** (top right of the repo menu).
3. In the left sidebar, click **Pages**.
4. Under **Build and deployment → Source**, choose **Deploy from a branch**.
5. Set **Branch** to `main` and the folder to **`/docs`**, then click **Save**.
6. Wait about a minute, then refresh the page. A green box appears with your link:

   **https://lazypotato1903.github.io/image-toolkit/**

That link is the website. Share it with anyone — they open it and use the tool
right away. No install, works on Windows, Mac, and phones.

## Updating the website later
Whenever the files in `docs` change (or you ask me to change them) and you upload
them, GitHub republishes the site automatically within a minute or two.

## What the website can do
- **Convert & Resize** images to JPG, PNG, or WEBP; resize by dimensions or to a
  target file size (KB).
- **Merge**: images into one PDF, join several PDFs, or stack images into one image.
- **Split PDF**: one file per page, a page range, or every N pages (downloaded as a ZIP).

Note: because it runs in a browser, image saving is JPG/PNG/WEBP (not BMP/TIFF).
