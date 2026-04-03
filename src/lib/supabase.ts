import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

export type Organization = {
  id: string;
  name: string;
  slug: string;
  description: string | null;
  editorial_notes: string | null;
  category: string;
  homepage_url: string | null;
  careers_url: string | null;
  has_career_page: boolean;
  city: string | null;
  state: string | null;
  region: string | null;
  roles: string[];
  employment_types: string[];
  is_starter: boolean;
  featured: boolean;
  last_verified: string | null;
  status: string;
  created_at: string;
  updated_at: string;
};
