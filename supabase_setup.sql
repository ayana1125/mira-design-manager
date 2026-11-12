-- MIRA DESIGN AI MANAGER: Supabase SQL setup
-- Supabase Dashboard > SQL Editor > New query に貼り付けて Run
create table if not exists public.projects (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  name text not null,
  client text not null,
  contact text,
  plan text,
  price integer not null default 0 check (price >= 0),
  due date,
  status text not null default '問い合わせ',
  memo text,
  created_at timestamptz not null default now()
);
alter table public.projects enable row level security;
drop policy if exists "Users can view own projects" on public.projects;
create policy "Users can view own projects" on public.projects
  for select to authenticated using (auth.uid() = user_id);
drop policy if exists "Users can insert own projects" on public.projects;
create policy "Users can insert own projects" on public.projects
  for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "Users can update own projects" on public.projects;
create policy "Users can update own projects" on public.projects
  for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "Users can delete own projects" on public.projects;
create policy "Users can delete own projects" on public.projects
  for delete to authenticated using (auth.uid() = user_id);
grant select, insert, update, delete on public.projects to authenticated;
