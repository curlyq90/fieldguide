# CLAUDE.md — The Outdoor Career Field Guide
> Persistent memory for Claude. Read this at the start of every session.

---

## Repository & Deployment

| Item | Value |
|---|---|
| Local path | `~/projects/fieldguide/` |
| GitHub repo | https://github.com/curlyq90/fieldguide |
| Hosting | Vercel |
| Git identity | name: `Tova Soroka`, email: `tova.soroka@gmail.com` |

**Critical:** Always set git user config before committing: `git config user.email "tova.soroka@gmail.com"` (already set locally, but verify if issues arise).

---

## Tech Stack

- **Plain HTML/CSS/JS** — no framework, no build step, no npm
- **Fonts:** Fraunces (display/serif) + Barlow (body/UI) via Google Fonts
- **Single page:** `index.html` — everything lives in one file
- **No separate CSS or JS files** — all styles and scripts are inline
- **Data:** Organization listings are hardcoded in a JS array (`const orgs=[...]`)

---

## CSS Design Tokens (defined in `:root`)

```css
--cream: #F5F0E6           /* warm background */
--cream-dark: #EDE6D6
--parchment: #FAF7F0        /* card/input backgrounds */
--forest: #1B3A2D           /* primary green / headings */
--forest-mid: #2D5E46       /* hover states, focus rings */
--forest-light: #3E7A5C
--slate: #3B3F42
--slate-light: #6B7075
--amber: #C87F3B            /* warm accent */
--amber-light: #E8A95B
--amber-pale: #FDF3E4
--rust: #A65D30             /* nonprofit/warm secondary */
--river: #3A6B8C            /* programs blue */
--river-pale: #E8F1F7
--ridge: #7B6B5D            /* companies earth tone */
--ridge-pale: #F0EBE4
--berry: #7A4B6A            /* industry orgs purple */
--berry-pale: #F3EAF0
--text: #2C2820             /* primary text */
--text-mid: #5C5549         /* body text */
--text-light: #8A8279       /* labels, secondary */
--border: #DDD6C8
--border-light: #EAE5DA
--card-bg: rgba(255,255,255,0.72)
--card-hover: rgba(255,255,255,0.92)
```

---

## Visual Language & Constraints

- Outdoor/topographic aesthetic — cream/forest/amber palette with mountain silhouettes
- Typography-led — Fraunces serif for headings/display, Barlow sans for body/UI
- SVG topographic background lines at 6% opacity
- Mountain ridge SVG hero divider
- **Do not change copy** — the voice is intentional
- **Do not introduce frameworks** (React, Tailwind, etc.)

---

## Page Architecture (index.html)

### Section Order
1. **Topo background** — fixed SVG with topographic lines
2. **Hero** — nav bar, mountain ridge SVG, title, description, stats
3. **Controls** — sticky search + category filter pills
4. **Main** — card grid grouped by category (or flat when filtered)
5. **Suggest modal** — form to suggest a new org (mailto-based)
6. **Dead link modal** — form to flag broken links (mailto-based)
7. **Footer** — attribution + suggest button

### Categories (5)
Each has a color, icon, and CSS class:
- `schools` — forest green
- `programs` — river blue
- `nonprofits` — amber/rust
- `companies` — ridge brown
- `industry` — berry purple

### Data Structure
```js
{ name: "Org Name", cat: "schools", desc: "Description.", url: "https://..." }
```
80+ organizations in `const orgs=[...]` array.

### Features
- **Search:** filters by name and description (case-insensitive)
- **Category filters:** pill buttons, "All" default, counts per category
- **Cards:** name, description, category tag, external link, dead-link flag button
- **Suggest modal:** mailto form → hello@tovasoroka.com
- **Dead link modal:** mailto form → hello@tovasoroka.com
- **Animations:** fadeUp on cards, sticky nav shadow on scroll

---

## Deployment Workflow

```bash
# 1. Edit files
# 2. Stage and commit
git add .
git commit -m "Description of change"
git push origin main
# 3. Vercel auto-deploys from main branch on push
```

**Vercel Hobby plan quirk:** Commits must come from the repo owner's verified GitHub email (`tova.soroka@gmail.com`). Foreign committer emails will block deployment.
