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
Already built in: title, description, canonical, Open Graph and Twitter cards, Person / ProfilePage / WebSite / ItemList structured data (no email or phone), favicon set, web manifest, robots.txt, sitemap.xml with image, 404 page, crawler-readable fallback content, fast non-blocking fonts.

You still need to do (this is what actually moves rankings):
1. **Search Console** (search.google.com/search-console): add a **URL prefix** property `https://tejash.is-a.dev/`. Pick the **HTML tag** method and send me the `<meta>` code, or the **HTML file** method (put the file in the repo root). The meta tag from the `google-site-verification=` DNS value is already in index.html in case Google accepts it.
2. Sitemaps → submit `sitemap.xml`. URL Inspection → Request indexing.
3. Bing Webmaster Tools → Import from Google Search Console.
4. Link to the site from your GitHub profile (Website field and profile README), every repo's Website field, LinkedIn, resume, WhatsApp/Instagram bio.
5. Optional but good: admin → Backup → **Download index.html with current content**, upload it. It bakes your content into the page for instant first load and for crawlers that don't run JavaScript.
6. Keep real content: replace the placeholder education and experience, add screenshots to each project.

## Instant updates
Run `supabase.sql` once more (the last block turns on Realtime for the site table). Edits then reach open pages in well under a second.
