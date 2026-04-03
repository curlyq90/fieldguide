"use client";

import { useState, useMemo } from "react";
import { Organization } from "@/lib/supabase";
import { OrgCard } from "./OrgCard";

export const CATEGORY_META: Record<
  string,
  { label: string; order: number; bgColor: string; textColor: string }
> = {
  "semester-schools": {
    label: "Semester & Expedition Schools",
    order: 1,
    bgColor: "#E8F1F7",
    textColor: "#3A6B8C",
  },
  "independent-schools": {
    label: "Independent Schools",
    order: 2,
    bgColor: "#E8F1F7",
    textColor: "#3A6B8C",
  },
  "outdoor-ed-programs": {
    label: "Outdoor Ed Programs",
    order: 3,
    bgColor: "#FDF3E4",
    textColor: "#A65D30",
  },
  nonprofits: {
    label: "Nonprofits & Access Orgs",
    order: 4,
    bgColor: "#FDF3E4",
    textColor: "#A65D30",
  },
  companies: {
    label: "Adventure & Outdoor Companies",
    order: 5,
    bgColor: "#F0EBE4",
    textColor: "#7B6B5D",
  },
  "public-lands": {
    label: "Public Lands & Agencies",
    order: 6,
    bgColor: "#E8F0E8",
    textColor: "#3E7A5C",
  },
  "industry-orgs": {
    label: "Industry Orgs & Job Boards",
    order: 7,
    bgColor: "#F3EAF0",
    textColor: "#7A4B6A",
  },
};

const CATEGORY_ORDER = [
  "semester-schools",
  "independent-schools",
  "outdoor-ed-programs",
  "nonprofits",
  "companies",
  "public-lands",
  "industry-orgs",
];

const REGIONS = [
  "Pacific Northwest",
  "Mountain West",
  "West Coast",
  "Southwest",
  "Northeast",
  "Mid-Atlantic",
  "Southeast",
  "Midwest",
  "Alaska",
  "International",
  "National / Remote",
];

export function OrgDirectory({ orgs }: { orgs: Organization[] }) {
  const [searchTerm, setSearchTerm] = useState("");
  const [activeCategory, setActiveCategory] = useState("all");
  const [activeRegion, setActiveRegion] = useState("all");

  const filtered = useMemo(() => {
    const term = searchTerm.toLowerCase().trim();
    return orgs.filter((org) => {
      if (activeCategory !== "all" && org.category !== activeCategory)
        return false;
      if (activeRegion !== "all" && org.region !== activeRegion) return false;
      if (
        term &&
        !org.name.toLowerCase().includes(term) &&
        !(org.description ?? "").toLowerCase().includes(term)
      )
        return false;
      return true;
    });
  }, [orgs, searchTerm, activeCategory, activeRegion]);

  const categoryCounts = useMemo(() => {
    const base = orgs.filter((org) => {
      if (activeRegion !== "all" && org.region !== activeRegion) return false;
      const term = searchTerm.toLowerCase().trim();
      if (
        term &&
        !org.name.toLowerCase().includes(term) &&
        !(org.description ?? "").toLowerCase().includes(term)
      )
        return false;
      return true;
    });
    const counts: Record<string, number> = { all: base.length };
    for (const cat of CATEGORY_ORDER) {
      counts[cat] = base.filter((o) => o.category === cat).length;
    }
    return counts;
  }, [orgs, searchTerm, activeRegion]);

  const grouped = useMemo(() => {
    if (activeCategory !== "all") return null;
    const groups: { category: string; orgs: Organization[] }[] = [];
    for (const cat of CATEGORY_ORDER) {
      const items = filtered
        .filter((o) => o.category === cat)
        .sort((a, b) => a.name.localeCompare(b.name));
      if (items.length > 0) {
        groups.push({ category: cat, orgs: items });
      }
    }
    return groups;
  }, [filtered, activeCategory]);

  return (
    <div className="space-y-6">
      {/* Search */}
      <div className="flex flex-col sm:flex-row gap-3">
        <input
          type="text"
          placeholder="Search organizations..."
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className="flex-1 rounded-lg border border-stone-300 px-4 py-2.5 text-sm bg-white placeholder:text-stone-400 focus:outline-none focus:ring-2 focus:ring-emerald-600 focus:border-transparent"
        />
        <select
          value={activeRegion}
          onChange={(e) => setActiveRegion(e.target.value)}
          className="rounded-lg border border-stone-300 px-3 py-2.5 text-sm bg-white text-stone-700 focus:outline-none focus:ring-2 focus:ring-emerald-600 focus:border-transparent"
        >
          <option value="all">All Regions</option>
          {REGIONS.map((r) => (
            <option key={r} value={r}>
              {r}
            </option>
          ))}
        </select>
      </div>

      {/* Category pills */}
      <div className="flex flex-wrap gap-2">
        <button
          onClick={() => setActiveCategory("all")}
          className={`px-3.5 py-1.5 rounded-full text-sm font-medium transition-colors ${
            activeCategory === "all"
              ? "bg-stone-800 text-white"
              : "bg-stone-100 text-stone-600 hover:bg-stone-200"
          }`}
        >
          All
          <span className="ml-1.5 text-xs opacity-70">
            {categoryCounts.all ?? 0}
          </span>
        </button>
        {CATEGORY_ORDER.map((cat) => {
          const meta = CATEGORY_META[cat];
          const count = categoryCounts[cat] ?? 0;
          if (count === 0 && activeCategory !== cat) return null;
          return (
            <button
              key={cat}
              onClick={() => setActiveCategory(cat)}
              className={`px-3.5 py-1.5 rounded-full text-sm font-medium transition-colors ${
                activeCategory === cat
                  ? "bg-stone-800 text-white"
                  : "bg-stone-100 text-stone-600 hover:bg-stone-200"
              }`}
            >
              {meta.label}
              <span className="ml-1.5 text-xs opacity-70">{count}</span>
            </button>
          );
        })}
      </div>

      {/* Results count */}
      {filtered.length !== orgs.length && (
        <p className="text-sm text-stone-500">
          {filtered.length} of {orgs.length} organizations
        </p>
      )}

      {/* Cards */}
      {filtered.length === 0 ? (
        <div className="text-center py-16 text-stone-500">
          <p className="text-lg">No organizations match your filters.</p>
          <p className="text-sm mt-1">Try a different search or category.</p>
        </div>
      ) : grouped ? (
        <div className="space-y-10">
          {grouped.map(({ category, orgs: catOrgs }) => (
            <section key={category}>
              <h2 className="text-lg font-serif font-semibold text-stone-800 mb-4 flex items-center gap-2">
                {CATEGORY_META[category]?.label}
                <span className="text-sm font-sans font-normal text-stone-400">
                  {catOrgs.length}
                </span>
              </h2>
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                {catOrgs.map((org) => (
                  <OrgCard key={org.id} org={org} />
                ))}
              </div>
            </section>
          ))}
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
          {filtered
            .sort((a, b) => a.name.localeCompare(b.name))
            .map((org) => (
              <OrgCard key={org.id} org={org} />
            ))}
        </div>
      )}
    </div>
  );
}
