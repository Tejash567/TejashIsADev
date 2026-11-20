# TejashIsADev

Personal developer portfolio. One HTML file, no build step. Content, screenshots and messages live in Supabase.

## 1. Set up Supabase (once)
1. Supabase dashboard → **SQL Editor** → paste `supabase.sql`. Run it (no edits needed).
2. **Authentication → Users → Add user** → your email + a strong password (tick auto-confirm).
3. **Authentication → Sign In / Providers → Email** → turn **off** "Allow new users to sign up".
4. (Optional) Authentication → URL Configuration: set Site URL to your published address.

The URL and publishable key in `index.html` are meant to be public. Row Level Security (from the SQL) decides who can write, and only your email can.

## 2. Publish (GitHub Pages)
Push files to `main`, then Settings → Pages → Deploy from a branch → main / root.

## 3. Edit your site
Open your site with `#admin` on the end, sign in with the Supabase email and password. Edits save to the cloud and go live for everyone. The first edit you make seeds the database. Uploads go to the `portfolio` storage bucket.
Messages from the contact form appear under **Messages**.

## 4. Email delivery (optional, Web3Forms)
Get a key at web3forms.com, paste it into admin → Profile → *Contact form endpoint*. Messages are then saved in Supabase and emailed to you.

## Fallbacks
`data.json` is used if Supabase is unreachable. Backup → Export data.json writes it.

## Live sync
Open pages check for changes every ~3 seconds, so admin edits appear for all visitors without a refresh.

## Projects from GitHub
Admin → Projects → **Load my repos**, tick the ones to show, **Add / update ticked**. Links, descriptions and the live-site link come from GitHub.
For screenshots, add a `screenshots` folder to each repo and name files like `1-Timed quiz mode.png`. The number sets the order, the text becomes the caption. Run **Sync all linked projects** after pushing new screenshots. The site also checks GitHub for new screenshots when it loads (switch off in Look).

## SEO checklist
1. Search Console: https://search.google.com/search-console → add property **URL prefix** `https://tejash.is-a.dev/`. Verify with the HTML file method: download the file Google gives you and put it in the repo root, push, then click Verify.
2. Sitemaps → submit `sitemap.xml`. Then URL Inspection → paste the home URL → Request indexing.
3. Add the site link everywhere you already exist: GitHub profile website field, each repo's website field, LinkedIn, resume. Backlinks are what make a personal name rank.
4. Check previews: share the link in WhatsApp/LinkedIn, or use the LinkedIn Post Inspector. Check structured data with Google's Rich Results Test.
5. Keep **Site URL** in admin → Profile correct if the domain ever changes.
