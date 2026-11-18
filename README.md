# TejashIsADev

Personal developer portfolio. Plain HTML, CSS and JavaScript in one file. No build step, no database.

## Publish (GitHub Pages)
1. Push these files to the `main` branch.
2. Repo **Settings → Pages → Deploy from a branch → main / (root)**.
3. Your site goes live at `https://tejash567.github.io/TejashIsADev/`.

## Edit your content
1. Open the site and add `#admin` to the address. Default password: `admin123`. Change it first.
2. Edit anything. Changes save in your browser only.
3. To publish for everyone: **Backup → Export data.json**, replace `data.json` in this repo, commit and push.
4. If you later see old content while logged in, use **Backup → Discard local edits**.

## Receive messages from the contact form
Without setup, the form opens the visitor's email app. To get messages straight to your inbox:
- **Web3Forms** (easiest): get a free access key at web3forms.com, paste the key into admin → Profile → *Contact form endpoint*.
- **Formspree**: create a form at formspree.io, paste its URL (`https://formspree.io/f/...`) into the same field.
Then export `data.json` and push.

## Notes
- The admin login runs in the browser and is for convenience only. Never store secrets in `data.json`.
- Contact email shown on the site is public. Use a dedicated address.
