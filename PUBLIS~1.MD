# How to publish Image Toolkit so anyone can download it

This sets things up once so a Windows server builds the app for you and gives you
a download link to share. You never build anything on your own PC.

You do **not** need to install Git or use any commands — everything is done on the
GitHub website.

---

## Part A — One-time setup (about 10 minutes)

1. Create a free GitHub account at https://github.com/signup (skip if you have one).
2. Make a new project ("repository"):
   - Go to https://github.com/new
   - "Repository name": type `image-toolkit`
   - Choose **Public** (required for free automatic builds).
   - Click **Create repository**.
3. Upload the app files:
   - On the new repository page, click the link **"uploading an existing file"**
     (or the **Add file -> Upload files** button).
   - Open the **ImageToolkit** folder on your PC and drag the **whole folder**
     into the browser upload box. Dragging the folder (rather than picking files
     one by one) keeps the important hidden **.github** folder, which is what tells
     the server how to build the app.
   - Wait for the files to finish uploading, then click **Commit changes**.

   Tip: if the build doesn't start in Part B, the `.github` folder probably didn't
   upload. Just tell me and I'll hand you a single ZIP to upload instead.

---

## Part B — Get the download link

1. In your repository, click the **Actions** tab at the top.
2. You'll see a run called **"Build Windows app"** working (yellow dot). Wait for
   it to turn into a green check (2–4 minutes).
3. Click that run. At the bottom under **Artifacts** you'll see
   **ImageToolkit-windows** — that's your built app. Click to download and test it.

### To get a permanent, shareable download page (a "Release")
1. Go to your repository home, click **Releases** (right side) -> **Create a new release**.
2. In **"Choose a tag"**, type `v1.3.0` and click **Create new tag**.
3. Click **Publish release**.
4. The server rebuilds the app and attaches **ImageToolkit.exe** to that release.
   The page URL (e.g. `https://github.com/YOURNAME/image-toolkit/releases`) is the
   link you share with anyone. They click, download `ImageToolkit.exe`, done.

---

## Updating the app later
Whenever you change the code (or ask me to), upload the changed files the same way.
The server rebuilds automatically. For a new public download, make a new release with
the next tag (v1.3.1, v1.4.0, and so on).

## If you'd rather not use GitHub at all
Just run **build.bat** on your PC once (see README.md) to get `ImageToolkit.exe`, then
send that single file to anyone. They double-click it — nothing to install.
Share **SHARE_READ_ME_FIRST.txt** alongside it so they know about the one-time
Windows security prompt.
