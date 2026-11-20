-- Run this once in Supabase: SQL Editor -> New query -> paste -> Run.
-- Before running: use Find & Replace in the editor to change OWNER_EMAIL to your own login email (keep the quotes).

-- Content (one row holds the whole site)
create table if not exists public.site (
  id int primary key default 1 check (id = 1),
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz default now()
);

-- Contact messages
create table if not exists public.messages (
  id bigint generated always as identity primary key,
  name text,
  email text,
  message text,
  created_at timestamptz default now()
);

alter table public.site enable row level security;
alter table public.messages enable row level security;

drop policy if exists "public read site" on public.site;
drop policy if exists "owner write site" on public.site;
drop policy if exists "anyone can send message" on public.messages;
drop policy if exists "owner reads messages" on public.messages;
drop policy if exists "owner deletes messages" on public.messages;

create policy "public read site" on public.site for select using (true);
create policy "owner write site" on public.site for all to authenticated
  using ((auth.jwt() ->> 'email') = 'OWNER_EMAIL')
  with check ((auth.jwt() ->> 'email') = 'OWNER_EMAIL');

create policy "anyone can send message" on public.messages for insert to anon, authenticated
  with check (char_length(coalesce(name,'')) <= 120 and char_length(coalesce(email,'')) <= 200 and char_length(coalesce(message,'')) between 1 and 4000);
create policy "owner reads messages" on public.messages for select to authenticated
  using ((auth.jwt() ->> 'email') = 'OWNER_EMAIL');
create policy "owner deletes messages" on public.messages for delete to authenticated
  using ((auth.jwt() ->> 'email') = 'OWNER_EMAIL');

-- Public file bucket for screenshots, logo and font
insert into storage.buckets (id, name, public) values ('portfolio', 'portfolio', true)
  on conflict (id) do nothing;

drop policy if exists "public read files" on storage.objects;
drop policy if exists "owner upload files" on storage.objects;
drop policy if exists "owner update files" on storage.objects;
drop policy if exists "owner delete files" on storage.objects;

create policy "public read files" on storage.objects for select using (bucket_id = 'portfolio');
create policy "owner upload files" on storage.objects for insert to authenticated
  with check (bucket_id = 'portfolio' and (auth.jwt() ->> 'email') = 'OWNER_EMAIL');
create policy "owner update files" on storage.objects for update to authenticated
  using (bucket_id = 'portfolio' and (auth.jwt() ->> 'email') = 'OWNER_EMAIL');
create policy "owner delete files" on storage.objects for delete to authenticated
  using (bucket_id = 'portfolio' and (auth.jwt() ->> 'email') = 'OWNER_EMAIL');
