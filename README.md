# PenBev | Portfolio Intelligence — MVP demo

A single-file, offline web app for SKU portfolio optimisation, covering 30 SKUs across Coca-Cola, Coca-Cola No Sugar, Sprite, Fanta, Schweppes, Powerade, Bonaqua and Appletiser in the Western and Northern Cape.

**Open it:** `dist/index.html`. It opens directly in a browser and needs no server, no install and no internet connection.

**Rebuild after editing:** run `./build.sh`. This embeds the logo into `src/app.html` as base64 and writes `dist/index.html`.

## Modules
1. **Executive Dashboard:** KPIs, 5-year trend, revenue Pareto, brand, channel and action mix, top and bottom SKUs, and Commercial, Finance and Manufacturing views.
2. **Golden Quadrant:** volume (log scale) against GM% or contribution %, with adjustable thresholds, search, lifecycle filter, and markers for new and strategic-exception SKUs.
3. **SKU Intelligence:** a sortable, filterable, paginated table with CSV export, plus a full SKU profile with 5-year history, a transparent score breakdown and substitute SKUs.
4. **Scoring Engine:** 7 weighted categories that must total 100%, with original-vs-adjusted ranking.
5. **Scenario Simulator:** presets at 5%, 15% and 30%, removal of single SKUs, pack formats or families, channel restrictions, adjustable assumptions, a waterfall chart, residual overhead and working capital, and saved scenarios.
6. **Executive Recommendations:** five action groups, overrides that require a reason, decision status, and a printable management summary.

Overrides, weights and scenarios are stored in the browser's localStorage. To run the built-in tests, open the browser console and run `PENBEV_TESTS()`.

## Data model and key assumptions
- The data is generated deterministically from a fixed seed, so every load is identical. It covers 60 months (Nov 2021 to Oct 2026), with summer seasonality and about 6.5% annual price inflation. New launches have no data before their launch date.
- Contribution = gross profit − logistics − 3% variable selling cost. Allocated overhead (8.5% of revenue) is treated as fixed and is never counted as a saving.
- Each sub-metric is scored as its percentile within the portfolio (0–100). Metrics that are unavailable are excluded and the weights are re-based; they are never set to zero.
- SKUs younger than 18 months are scored on their annualised 3-month run-rate and are never auto-flagged for exit.
