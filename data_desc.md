# September 2025 Columbus Airbnb Estimates — Data Dictionary / Description

**Dataset:** Columbus Airbnb Dataset (September 2025 Estimates)  
**Publisher:** Inside Airbnb
**Website:** https://insideairbnb.com/get-the-data/  

> Not all fields are available for every type of estimate.

---

## Overview

This dataset provides employment and wage estimates for occupations (SOC) by geography (U.S., state, territory, metropolitan and nonmetropolitan areas) and, for some releases, by industry (NAICS) and ownership. Estimates include employment counts, measures of sampling error (PRSE), and wage levels (mean and percentiles) on hourly and/or annual bases.

---

## Field Definitions

| Field | Description |
|---|---|
| `id` | Unique Airbnb listing ID. |
| `name` | Listing title. |
| `host_id` | Unique host ID. |
| `host_name` | Host's first name. |
| `neighbourhood_group` | Neighbourhood group (may be empty for Columbus). |
| `neighbourhood` | Neighbourhood name. |
| `latitude/longitude` | Listing coordinates. |
| `room_type` | Entire home/apt, Private room, Shared room, or Hotel room. |
| `price` | Nightly price in USD (integer). |
| `minimum_nights` | Minimum nights required per booking. |
| `number_of_reviews` | Total review count. |
| `last_review` | Date of most recent review (YYYY-MM-DD; blank if no reviews). |
| `reviews_per_month` | Average reviews per month (blank if no reviews). |
| `calculated_host_listings_count` | Number of listings the host has in Columbus. |
| `availability_365` | Days available in the next year (0 = fully booked or delisted). |
| `number_of_reviews_ltm` | Reviews in the last 12 months. |
| `license` | License/registration number (if applicable). |

---

## Source Citation

Inside Airbnb. *Airbnb Statistics, November 2025 Downloads.*  
https://insideairbnb.com/get-the-data/
