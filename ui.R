# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)

fluidPage(
  titlePanel("CMC Seoul NGS Ion Torrent"),
  
  # Create a new Row in the UI for selectInputs
  tabsetPanel(
    tabPanel("Variant",
             column(4, textInput(
               "sym1", "Hugo_Symbol", "All"
             )),
    fluidRow(# Create a new row for the table.
    DT::dataTableOutput("table1")
      ),
    downloadButton("downloadVariant", "Download")
    ),
  
  tabPanel("Case",
           column(4, textInput(
             "sym2", "Cancer Type", "All"
           )),
           fluidRow(
             DT::dataTableOutput("table2")
           ),
           downloadButton("downloadCase", "Download")
    )
  )
)
