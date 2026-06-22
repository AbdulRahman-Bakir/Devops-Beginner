# GitHub Pages Deployment

roadmap.sh project: https://roadmap.sh/projects/github-actions-deployment-workflow

A CI/CD task that deploys a static site (`index.html`) to **GitHub Pages**
using **GitHub Actions**.

## How it works
The workflow at `.github/workflows/deploy.yml`:
- **Triggers** on every push to `main` that changes `index.html`.
- **Permissions:** `pages: write` and `id-token: write` (required for Pages deploys).
- **Steps:** checkout → configure Pages → upload the folder as a Pages artifact →
  deploy with `actions/deploy-pages`.

## ⚠️ Required setup (important)
This deploys only when it lives at the **root of its own GitHub repository**, not
as a subfolder. To make it actually deploy:

1. Put `index.html` and the `.github/workflows/deploy.yml` at the **repo root**.
2. In the repo: **Settings → Pages → Build and deployment → Source = "GitHub Actions"**.
3. Push to `main`. The Actions run publishes the site, and the live URL appears
   in the deploy job's output (and under Settings → Pages).

> Inside this combined `Devops-Projects` repo the workflow will **not** run a real
> deployment, because the workflow path and `index.html` are not at the repo root.
> The files here document the completed task; copy them into a dedicated repo to
> see a live deploy.

## Files
- `index.html` — the static page to publish
- `.github/workflows/deploy.yml` — the deployment workflow
