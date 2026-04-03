import { Organization } from "@/lib/supabase";
import { CATEGORY_META } from "./OrgDirectory";

export function OrgCard({ org }: { org: Organization }) {
  const catMeta = CATEGORY_META[org.category];
  const location = [org.city, org.state].filter(Boolean).join(", ");

  return (
    <div className="bg-white rounded-lg border border-stone-200 p-5 hover:shadow-md transition-shadow flex flex-col">
      <h3 className="font-semibold text-stone-900 text-base leading-tight">
        {org.name}
      </h3>

      {location && (
        <p className="text-xs text-stone-500 mt-1">{location}</p>
      )}

      <p className="text-sm text-stone-600 mt-2 flex-1 leading-relaxed">
        {org.description}
      </p>

      <div className="mt-4 flex items-center justify-between gap-2">
        <span
          className="inline-block text-xs font-medium px-2.5 py-1 rounded-full"
          style={{
            backgroundColor: catMeta?.bgColor ?? "#f5f5f4",
            color: catMeta?.textColor ?? "#57534e",
          }}
        >
          {catMeta?.label ?? org.category}
        </span>

        {org.homepage_url && (
          <a
            href={org.homepage_url}
            target="_blank"
            rel="noopener noreferrer"
            className="text-sm font-medium text-emerald-700 hover:text-emerald-800 flex items-center gap-1 shrink-0"
          >
            Visit site
            <svg
              width="12"
              height="12"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth="2.5"
              strokeLinecap="round"
            >
              <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6" />
              <polyline points="15 3 21 3 21 9" />
              <line x1="10" y1="14" x2="21" y2="3" />
            </svg>
          </a>
        )}
      </div>

      {org.is_starter && (
        <div className="mt-3 text-xs font-medium text-amber-700 bg-amber-50 px-2.5 py-1 rounded-full self-start">
          Start here
        </div>
      )}
    </div>
  );
}
