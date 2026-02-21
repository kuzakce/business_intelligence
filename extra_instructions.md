# Extra Instructions

## Room Type filter (exact)
- Valid values for room_type: 
  -`'Entire home/apt'`
  -`'Private room'`
  -`'Shared room'`
  -`'Hotel room'`
- Values are **case-sensitive** and must match exactly.

## Neighbourhood filter
- Column is **case-sensitive** and must always match exact spelling.
- Do not use partial matches unless explicitly stated.

## Price 
- Represents the nightly rate in whole US dollars.
- Use numeric comparisons (e.g., price < 100).
- Taxes or cleaning fees may not be included.

## Handling listings
- If `number_of_reviews = 0`:
  - `last_review is NULL`
  - `reviews_per_month is NULL`

## Availability Interpretation
- `availability_365` represents the number of day available in the next 365 days.
- If `availability_365 = 0`:
  - Listing is fully booked or inactive.
- Higher values indicate greater availability

## Host Analysis
- `calculated_host_listings_count` indicates how many listings a host operates. 
- If `calculated_host_listings_count > 1`:
  - This indicates that there are multi-listing hosts

## Default Behavior for Amiguous Queries
- If `room_type` is not specified, include all room types.
- If `neighbourhood` is not specified, include all neighbourhoods.
- If `price` is not specified, do not set a price filter

## Verification step (recommended)
If any filter is ambiguous, request a preview first:
- “Show matching rows so I can confirm `naics_title`, `o_group`, and `occ_title` before aggregating.”

## Action wording (so I take the right next step)
Start your request with:
- **Calculate** / **Compute** → run a query and return computed results
- **Show** / **Filter to** → update the dashboard view and return all columns

---

# Default behavior
If you include the relevant filters, I will apply these rules automatically. If a request is ambiguous, I will first show the matching rows and ask you to confirm the labels before aggregating.
