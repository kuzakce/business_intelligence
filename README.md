---
sdk: docker
app_port: 7860
title: ISA 401 Columbus Airbnb Explorer
emoji: 📊
colorFrom: yellow
colorTo: yellow
pinned: false
license: mit
short_description: Explore the Airbnb data located in Columbus, Ohio.
---

# ISA 401 Columbus Airbnb Explorer

**Your AI-Powered Assistant for Exploring Occupational Employment and Wage Statistics**

[![Live App](https://img.shields.io/badge/Live_App-Hugging_Face-yellow)](https://huggingface.co/spaces/fmegahed/querychat_demo)

Explore the Columbus Airbnb dataset using using natural language queries.
---

## What is this app?

This Shiny application uses AI-powered natural language processing to help you explore the Columbus Airbnb dataset. Instead of writing SQL queries, simply ask questions in plain English and get instant results.

**Example queries:**
- "Show entire homes under $150 in Short North."
- "What neighborhoods have the highest average price?"
- "Which hosts have more than 5 listings?"
- "Show listings with availability greater than 300 days."

---

## Dataset Information

**Dataset:** Columbus Airbnb Datasat (September 2024 Estimates)
**Publisher:** Inside Airbnb
**Website:** https://insideairbnb.com/get-the-data/

The Columbus Airbnb program produces data surrounding different questions about the listings, such as ID, listing name, host ID, neighbourhood, room type, price, reviews, availability, and many more. 

### Key Fields

| Field | Description |
|-------|-------------|
| `name` | Listing title |
| `neighbourhood` | Neighbourhood name |
| `room_type` | Room type for the listing |
| `price` | Price per night in USD |
| `availability_365` | Days available in the next year |

---

## Features

- **Natural Language Queries**: Ask questions in plain English
- **SQL Transparency**: See the generated SQL for each query
- **Interactive Data Table**: Sort, filter, and export results
- **Miami University Theming**: Branded for ISA 401 course use

---

## Running Locally

**With R:**
```r
# Install dependencies
renv::restore()

# Run the app
shiny::runApp('.', host = '0.0.0.0', port = 7860)
```

**With Docker:**
```bash
# Build the image
docker build -t oews-explorer .

# Run with OpenAI API key
docker run --rm -p 7860:7860 -e OPENAI_API_KEY=$OPENAI_API_KEY columbusairbnb-explorer
```

---

## Required Environment Variable

This app requires an OpenAI API key to function:

```bash
export OPENAI_API_KEY="your-api-key-here"
```

On Hugging Face Spaces, set this as a secret in your Space settings.

---

## Technology Stack

- **[Shiny](https://shiny.posit.co/)** - Web application framework for R
- **[querychat](https://github.com/posit-dev/querychat)** - Natural language data querying
- **[bslib](https://rstudio.github.io/bslib/)** - Bootstrap theming for Shiny
- **[DT](https://rstudio.github.io/DT/)** - Interactive data tables

---

## Course Information

This application was developed for **ISA 401** at **Miami University** to help students explore and understand labor market data using modern AI-powered tools.

---

## Data Source

Inside Airbnb. *Airbnb Statistics, November 2025 Downloads.*  
https://insideairbnb.com/get-the-data/

