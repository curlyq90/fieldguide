# CLAUDE.md — The Outdoor Career Field Guide
> Persistent memory for Claude. Read this at the start of every session.

---

## Repository & Deployment

| Item | Value |
|---|---|
| Local path | `~/projects/fieldguide/` |
| GitHub repo | https://github.com/curlyq90/fieldguide |
| Hosting | Vercel (auto-deploys from `main`) |
| Domain | fieldguide.work |
| Git identity | name: `Tova Soroka`, email: `tova.soroka@gmail.com` |
| Supabase project | https://supabase.com/dashboard/project/dznsbaqptfmftfkeqacq |

**Critical:** Commits must come from `tova.soroka@gmail.com` or Vercel Hobby plan will block deployment.

---

## Tech Stack

- **Next.js** (App Router) with TypeScript
- **Tailwind CSS** v4 (via `@tailwindcss/postcss`)
- **Supabase** — PostgreSQL database, auth, RLS
- **Fonts:** Fraunces (serif/display) + Barlow (sans/body) via `next/font/google`
- **Package manager:** npm

---

## Environment Variables

Required in `.env.local` (and in Vercel project settings):

```
NEXT_PUBLIC_SUPABASE_URL=https://dznsbaqptfmftfkeqacq.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=<anon key from Supabase dashboard>
```

---

## Project Structure

```
fieldguide/
├── prototype/
│   └── outdoor-careers.html    # Original HTML prototype (design reference)
├── supabase/
│   ├── schema.sql              # Database tables, RLS policies, triggers
│   └── seed.sql                # 75 organizations seed data
├── src/
│   ├── app/
│   │   ├── layout.tsx          # Root layout with fonts + metadata
│   │   ├── page.tsx            # Homepage (server component, fetches orgs)
│   │   └── globals.css         # Tailwind imports + theme
│   ��── components/
│   │   ├── OrgDirectory.tsx    # Client component: search, filters, card grid
│   │   └── OrgCard.tsx         # Single organization card
│   └��─ lib/
│       └── supabase.ts         # Supabase client + Organization type
├── .env.local                  # Supabase credentials (gitignored)
├── CLAUDE.md
├── next.config.ts
├── package.json
└── tsconfig.json
```

---

## Database (Supabase)

### Tables
- **organizations** — 75 orgs with name, slug, description, category, location, URLs, status
- **submissions** — public submission queue (pending/approved/rejected)
- **dead_link_reports** — broken link reports (pending/fixed/dismissed)

### Categories (7)
| Slug | Display Label |
|---|---|
| `semester-schools` | Semester & Expedition Schools |
| `independent-schools` | Independent Schools |
| `outdoor-ed-programs` | Outdoor Ed Programs |
| `nonprofits` | Nonprofits & Access Orgs |
| `companies` | Adventure & Outdoor Companies |
| `public-lands` | Public Lands & Agencies |
| `industry-orgs` | Industry Orgs & Job Boards |

### Regions (11)
Pacific Northwest, Mountain West, West Coast, Southwest, Northeast, Mid-Atlantic, Southeast, Midwest, Alaska, International, National / Remote

### RLS Summary
- Organizations: public SELECT (active only), authenticated for mutations
- Submissions: public INSERT, authenticated for read/update/delete
- Dead link reports: public INSERT, authenticated for read/update/delete

---

## Design Reference

The original HTML prototype is preserved at `prototype/outdoor-careers.html`. It contains:
- The visual design system (topo background, mountain ridge, earth tone palette)
- All CSS custom properties / design tokens
- The original copy and voice

Current site uses clean minimal Tailwind. Visual design matching is a future session.

### CSS Design Tokens (from prototype)

```css
--cream: #F5F0E6           /* warm background */
--cream-dark: #EDE6D6
--parchment: #FAF7F0        /* card/input backgrounds */
--forest: #1B3A2D           /* primary green / headings */
--forest-mid: #2D5E46       /* hover states, focus rings */
--forest-light: #3E7A5C
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
```

---

## Deployment Workflow

```bash
npm run build          # Verify locally first
git add <files>
git commit -m "Description of change"
git push origin main   # Vercel auto-deploys
```

---

## Build Phases

- **Phase 1** (done): Next.js + Supabase + public homepage with search/filters
- **Phase 2**: Submission form + dead link reporting UI
- **Phase 3**: Admin panel with Supabase Auth
- **Phase 4**: Visual design matching the prototype
- **Phase 5**: Editorial content (/break-in page)
