-- Field Guide Database Schema
-- Run this in the Supabase SQL Editor: https://supabase.com/dashboard/project/dznsbaqptfmftfkeqacq/sql

-- =============================================================================
-- ORGANIZATIONS
-- =============================================================================
CREATE TABLE organizations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text UNIQUE NOT NULL,
  description text,
  editorial_notes text,
  category text NOT NULL CHECK (category IN (
    'semester-schools',
    'independent-schools',
    'outdoor-ed-programs',
    'nonprofits',
    'companies',
    'public-lands',
    'industry-orgs'
  )),
  homepage_url text,
  careers_url text,
  has_career_page boolean DEFAULT false,
  city text,
  state text,
  region text CHECK (region IS NULL OR region IN (
    'Pacific Northwest',
    'Mountain West',
    'Southwest',
    'Northeast',
    'Mid-Atlantic',
    'Southeast',
    'Midwest',
    'West Coast',
    'Alaska',
    'International',
    'National / Remote'
  )),
  roles text[] DEFAULT '{}',
  employment_types text[] DEFAULT '{}',
  is_starter boolean DEFAULT false,
  featured boolean DEFAULT false,
  last_verified date,
  status text DEFAULT 'active' CHECK (status IN ('active', 'needs-review', 'inactive')),
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE INDEX idx_organizations_category ON organizations (category);
CREATE INDEX idx_organizations_status ON organizations (status);
CREATE INDEX idx_organizations_region ON organizations (region);

-- Auto-update updated_at on row changes
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_organizations_updated_at
  BEFORE UPDATE ON organizations
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- =============================================================================
-- SUBMISSIONS
-- =============================================================================
CREATE TABLE submissions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  org_name text NOT NULL,
  website text,
  category text,
  notes text,
  submitter_email text,
  status text DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
  admin_notes text,
  created_at timestamptz DEFAULT now(),
  reviewed_at timestamptz
);

-- =============================================================================
-- DEAD LINK REPORTS
-- =============================================================================
CREATE TABLE dead_link_reports (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id uuid REFERENCES organizations(id) ON DELETE CASCADE,
  reported_url text NOT NULL,
  issue_description text,
  status text DEFAULT 'pending' CHECK (status IN ('pending', 'fixed', 'dismissed')),
  created_at timestamptz DEFAULT now()
);

CREATE INDEX idx_dead_link_reports_org ON dead_link_reports (organization_id);
CREATE INDEX idx_dead_link_reports_status ON dead_link_reports (status);

-- =============================================================================
-- ROW LEVEL SECURITY
-- =============================================================================

-- Organizations: public can read active records, authenticated can do everything
ALTER TABLE organizations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public can read active organizations"
  ON organizations FOR SELECT
  USING (status = 'active');

CREATE POLICY "Authenticated users can insert organizations"
  ON organizations FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can update organizations"
  ON organizations FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated users can delete organizations"
  ON organizations FOR DELETE
  TO authenticated
  USING (true);

-- Submissions: anyone can insert, authenticated can read/update/delete
ALTER TABLE submissions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can submit"
  ON submissions FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can read submissions"
  ON submissions FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Authenticated users can update submissions"
  ON submissions FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated users can delete submissions"
  ON submissions FOR DELETE
  TO authenticated
  USING (true);

-- Dead link reports: anyone can insert, authenticated can read/update/delete
ALTER TABLE dead_link_reports ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can report dead links"
  ON dead_link_reports FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can read reports"
  ON dead_link_reports FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Authenticated users can update reports"
  ON dead_link_reports FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated users can delete reports"
  ON dead_link_reports FOR DELETE
  TO authenticated
  USING (true);
