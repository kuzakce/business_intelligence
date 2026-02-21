# ISA 401 OEWS Jobs Explorer
# A Shiny app for exploring U.S. Occupational Employment and Wage Statistics
# Built with querychat for natural language data querying

library(shiny)

# ---------------------------------------------------------------------------
# Data & QueryChat setup
# ---------------------------------------------------------------------------

listings <- as.data.frame(readRDS("../data/listings (3).rds"))

# Pre-compute static stats for the Home tab
n_listings <- nrow(listings)
n_neighbourhood<- length(unique(listings$neighbourhood))
n_hosts <- length(unique(listings$host_id))
data_period   <- "September 2025"

client <- ellmer::chat_openai(
  model = "gpt-5-mini-2025-08-07",
  credentials = function() { return(Sys.getenv("OPENAI_API_KEY")) }
)

qc <- querychat::querychat(
  listings,
  client = client,
  greeting = "Welcome to Our ISA 401 Assistant for Understanding the Columbus Airbnb Dataset",
  extra_instructions = "data/extra_instructions.md",
  data_description = "data/data_desc.md"
)

# ---------------------------------------------------------------------------
# UI
# ---------------------------------------------------------------------------

ui <- bslib::page_navbar(
  id = "navbar",
  title = "Columbus Airbnb Explorer",
  theme = bslib::bs_theme(primary = "#C3142D"),
  navbar_options = bslib::navbar_options(bg = "#C3142D"),
  fillable = "Explorer",

  sidebar = bslib::sidebar(
    id = "sidebar",
    width = 325,
    shiny::conditionalPanel(
      "input.navbar == 'Explorer'",
      qc$ui()
    ),
    shiny::conditionalPanel(
      "input.navbar == 'Home'",
      tags$div(
        class = "p-2",
        tags$h5("Welcome!"),
        tags$p("Use the tabs above to explore the data. The ",
               tags$strong("Explorer"), " tab lets you query the Airbnb dataset
               using natural language."),
        tags$hr(),
        tags$p("Try asking things like:"),
        tags$ul(
          tags$li("Show me the listings for room type: Hotel room."),
          tags$li("Filter the price range: $100-150."),
          tags$li("Which hosts have more than one listing?")
        )
      )
    ),
    fillable = TRUE
  ),

  # ---------- Home Tab ----------
  bslib::nav_panel(
    title = "Home",
    value = "Home",
    icon = bsicons::bs_icon("house"),

    # Hero card
    bslib::card(
      class = "bg-dark text-white border-0",
      style = "background: linear-gradient(135deg, #C3142D 0%, #8B0E20 100%);",
      bslib::card_body(
        class = "text-center py-5",
        tags$h1("Columbus Airbnb Explorer", class = "display-4 fw-bold"),
        tags$p(
          class = "lead mt-3 mb-4",
          "Explore Columbus Airbnb Explorer using natural language queries powered by AI"
        ),
        tags$p(class = "text-white-50 mb-4", "A Business Intelligence and Data Visualization Assignment for ISA 401 at Miami University"),
        shiny::actionButton(
          "go_explorer", "Start Exploring",
          class = "btn btn-outline-light btn-lg px-4",
          icon = shiny::icon("magnifying-glass")
        )
      )
    ),

    # App metadata row
    bslib::layout_column_wrap(
      width = 1 / 4,
      fill = FALSE,
      bslib::value_box(
        title = "Version",
        value = "0.1.0",
        showcase = bsicons::bs_icon("tag"),
        theme = "light"
      ),
      bslib::value_box(
        title = "Last Updated",
        value = "Feb 2026",
        showcase = bsicons::bs_icon("calendar-check"),
        theme = "light"
      ),
      bslib::value_box(
        title = "By",
        value = tags$span("Claire Kuzak", style = "font-size: 1em;"),
        p("Miami University"),
        showcase = bsicons::bs_icon("person"),
        theme = "light"
      ),
      bslib::value_box(
        title = "Data Period",
        value = data_period,
        p(format(n_listings, big.mark = ","), " listings ",
          format(n_neighbourhood, big.mark = ","), " neighbourhood ",
          format(n_hosts, big.mark = ","), " hosts "),
        showcase = bsicons::bs_icon("house-door"),
        theme = "light"
      )
    ),

    # Developer / About + Tutorial row
    bslib::layout_columns(
      col_widths = c(6, 6),
      fill = FALSE,

      bslib::card(
        bslib::card_header(class = "fw-bold", bsicons::bs_icon("info-circle"), " About"),
        bslib::card_body(
          tags$p(
            "This app uses the ",
            tags$a("querychat", href = "https://posit-dev.github.io/querychat/",
                   target = "_blank"),
            " R package to let you query the ",
            tags$strong("Airbnb September 2025"),
            " dataset from the ",
            tags$a("Inside Airbnb",
                   href = "https://insideairbnb.com/get-the-data/", target = "_blank"),
            " using plain English. Under the hood, your questions are translated
            to SQL by an OpenAI language model."
          ),
          tags$hr(),
          tags$h6(class = "fw-bold mb-2", "Developer"),
          tags$div(
            class = "d-flex align-items-start gap-3",
            bsicons::bs_icon("person-circle", size = "2em"),
            tags$div(
              tags$div(class = "fw-semibold", "Claire Kuzak"),
              tags$small(class = "text-muted d-block",
                         "Business Analytics Major, Farmer School of Business"),
              tags$small(class = "text-muted d-block mb-2", "Miami University"),
              tags$div(
                class = "d-flex flex-wrap gap-2",
                tags$a(class = "btn btn-outline-secondary btn-sm",
                       href = "mailto:kuzakce@miamioh.edu",
                       bsicons::bs_icon("envelope"), " Email"),
                tags$a(class = "btn btn-outline-secondary btn-sm",
                       href = "www.linkedin.com/in/clairekuzak",
                       target = "_blank",
                       bsicons::bs_icon("linkedin"), " LinkedIn"),
                tags$a(class = "btn btn-outline-secondary btn-sm",
                       href = "https://github.com/kuzakce",
                       target = "_blank",
                       shiny::icon("github"), " GitHub")
              )
            )
          ),
          tags$hr(),
          tags$h6(class = "fw-bold mb-2", "Data Source"),
          tags$div(
            class = "d-flex flex-wrap gap-2",
            tags$a(class = "btn btn-outline-primary btn-sm",
                   href = "https://insideairbnb.com/get-the-data/", target = "_blank",
                   bsicons::bs_icon("table"), " Airbnb Tables"),
          )
        )
      ),

      bslib::card(
        bslib::card_header(class = "fw-bold", bsicons::bs_icon("play-circle"), " Video Tutorial"),
        bslib::card_body(
          fillable = FALSE,
          tags$div(
            class = "ratio ratio-16x9",
            tags$iframe(
              src = "https://youtu.be/PUKJMcQ4XGI",
              allowfullscreen = NA,
              allow = "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            )
          )
        )
      )
    )
  ),

  # ---------- Explorer Tab ----------
  bslib::nav_panel(
    title = "Explorer",
    value = "Explorer",
    icon = bsicons::bs_icon("search"),

    bslib::card(
      bslib::card_header(shiny::textOutput("explorer_table_title")),
      DT::DTOutput("table")
    ),

    bslib::accordion(
      open = FALSE,
      bslib::accordion_panel(
        title = "SQL Query",
        icon = bsicons::bs_icon("code-square"),
        shiny::verbatimTextOutput("sql")
      )
    )
  )
)

# ---------------------------------------------------------------------------
# Server
# ---------------------------------------------------------------------------

server <- function(input, output, session) {
  qc_vals <- qc$server()

  # Navigate to Explorer tab on button click
  shiny::observeEvent(input$go_explorer, {
    bslib::nav_select("navbar", "Explorer")
  })

  output$explorer_table_title <- shiny::renderText({
    qc_vals$title() %||% "Airbnb Listings"
  })

  output$table <- DT::renderDT({
    DT::datatable(
      qc_vals$df(),
      fillContainer = TRUE,
      options = list(scrollX = TRUE, pageLength = 15)
    )
  })

  output$sql <- shiny::renderText({
    qc_vals$sql() %||% "SELECT * FROM listings"
  })
}

shiny::shinyApp(ui, server)

