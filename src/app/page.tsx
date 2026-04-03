import { supabase, Organization } from "@/lib/supabase";
import { OrgDirectory } from "@/components/OrgDirectory";

export default async function Home() {
  const { data: orgs, error } = await supabase
    .from("organizations")
    .select("*")
    .eq("status", "active")
    .order("name");

  if (error) {
    console.error("Failed to fetch organizations:", error);
  }

  return (
    <div className="min-h-screen flex flex-col">
      <header className="border-b border-stone-200 bg-white">
        <div className="max-w-6xl mx-auto px-4 py-6 sm:px-6 lg:px-8">
          <h1 className="text-3xl font-serif font-bold text-stone-900 tracking-tight">
            The Outdoor Career Field Guide
          </h1>
          <p className="mt-2 text-stone-600 max-w-2xl">
            A curated directory of outdoor education employers, adventure
            companies, nonprofits, and industry organizations. Find your next
            role in the outdoor industry.
          </p>
          {orgs && (
            <p className="mt-3 text-sm text-stone-500">
              {orgs.length} organizations across 7 categories
            </p>
          )}
        </div>
      </header>

      <main className="flex-1">
        <div className="max-w-6xl mx-auto px-4 py-8 sm:px-6 lg:px-8">
          <OrgDirectory orgs={(orgs as Organization[]) ?? []} />
        </div>
      </main>

      <footer className="border-t border-stone-200 bg-white">
        <div className="max-w-6xl mx-auto px-4 py-6 sm:px-6 lg:px-8 text-center text-sm text-stone-500">
          Created by{" "}
          <a
            href="https://tovasoroka.com"
            className="underline hover:text-stone-700"
            target="_blank"
            rel="noopener noreferrer"
          >
            Tova Soroka
          </a>
        </div>
      </footer>
    </div>
  );
}
