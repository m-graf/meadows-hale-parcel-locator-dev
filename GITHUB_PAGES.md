# Hosting Meadows-Hale on GitHub Pages

Follow these steps to put your app online so **shareable links work on iOS** (no more "remote content blocked" when opening HTML files).

**Repo name:** `meadows-hale-parcel-locator`

---

## Step 1: Push your code to GitHub

If the repo isn’t on GitHub yet:

1. Create a new repo at [github.com/new](https://github.com/new).
   - Name it **meadows-hale-parcel-locator**.
   - **Do not** add a README, .gitignore, or license (you already have files).
2. In Terminal, from your project folder:

```bash
cd /path/to/meadows-hale-parcel-locator

# If you haven't added a remote yet:
git remote add origin https://github.com/YOUR_USERNAME/meadows-hale-parcel-locator.git

# Push your branch
git push -u origin main
```

Replace `YOUR_USERNAME` with your GitHub username.

---

## Step 2: Turn on GitHub Pages

1. Open your repo on GitHub.
2. Click **Settings**.
3. In the left sidebar, click **Pages** (under "Code and automation").
4. Under **Build and deployment**:
   - **Source:** Deploy from a branch
   - **Branch:** `main` (or whatever branch you use)
   - **Folder:** `/ (root)`
5. Click **Save**.

---

## Step 3: Wait for the first deploy

- GitHub will build and deploy. The first time can take 1–2 minutes.
- At the top of the **Pages** settings you’ll see something like:
  - **Your site is live at `https://YOUR_USERNAME.github.io/meadows-hale-parcel-locator/`**

---

## Step 4: Use the app

- **Admin:**  
  `https://YOUR_USERNAME.github.io/meadows-hale-parcel-locator/admin.html`
- **Client (map) for a property:**  
  `https://YOUR_USERNAME.github.io/meadows-hale-parcel-locator/client.html?map=MAP_ID`

After you paste a Land ID URL and click **Generate**, use **Copy link** and share that URL. Anyone (including on iOS) can open it and the map will load correctly.

---

## Optional: Custom domain

In **Settings → Pages** you can set a **Custom domain** (e.g. `maps.meadows-hale.com`) and point your DNS there. GitHub has instructions on the same page.

---

## Troubleshooting

- **404 on admin.html**  
  Make sure the branch and folder are correct and the deploy finished. Check the **Actions** tab for the "pages build and deployment" workflow.
- **Map is blank**  
  Confirm you’re using the **link** (Copy link), not the downloaded HTML file, when testing on iOS.
- **Mixed content / blocked**  
  GitHub Pages is HTTPS, so scripts and tiles should load. If you see errors, open the link in Safari and check the address bar is `https://YOUR_USERNAME.github.io/meadows-hale-parcel-locator/...`.
