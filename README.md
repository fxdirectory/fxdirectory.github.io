# fx-directory (static for GitHub Pages)

This repository contains a small personal portfolio/site converted to static HTML so it can be hosted on GitHub Pages.

What changed:
- Converted PHP pages to static HTML (`about.html`, `project.html`, `library.html`).
- Updated `index.html` menu links to point to `.html` pages.
- Added `tools.html` placeholder and `.nojekyll` to avoid Jekyll processing.

Quick publish steps (PowerShell):

1. Create a repository on GitHub (or use an existing one). If you want a user/organization page (no repo name in URL), name the repo `<your-username>.github.io`.

2. Push this site to the `main` branch:

```powershell
git init
git add .
git commit -m "Prepare static site for GitHub Pages"
git branch -M main
git remote add origin https://github.com/<your-username>/<your-repo>.git
git push -u origin main
```

3. In GitHub: Repository -> Settings -> Pages, set Source to `main` branch and folder `/ (root)`.

4. Wait a minute. Your site will appear at `https://<your-username>.github.io/<your-repo>/` (or `https://<your-username>.github.io/` for a user/organization page).

Custom domain (CNAME):
- To use a custom domain, create a `CNAME` file in the repo root containing just your domain (for example `example.com`) and add the same domain in the Pages settings. Replace the placeholder in `CNAME` with your actual domain.

SEO & metadata improvements included:
- Basic `meta description` and Open Graph (`og:title`, `og:description`) were added to main pages.

Responsive & accessibility improvements included:
- Added a basic responsive media query to `asset/style.css` to stack the side menu on small screens and scale images.
- Added more meaningful `alt` text for banner images.

Image optimization (recommended):
- I included a small PowerShell helper script `scripts/optimize-images.ps1` that uses ImageMagick (if installed) to create WebP versions of images and compress them. Run it locally before committing optimized images. Instructions are in the script.

Optional: Automatic build workflow
- A lightweight GitHub Actions workflow was added at `.github/workflows/validate.yml` that runs on `push` to validate the repository (checkout + basic job). If you need automatic rendering from PHP or more advanced builds, I can provide a workflow that runs PHP and commits the generated static files.

Need help next?
- I can: update page titles/OG images, implement a nicer responsive layout, create WebP optimized images and replace references, or add a deploy workflow that publishes via the Pages API.

Replace placeholders in `README.md` and `CNAME` with your repo URL and custom domain as needed.
