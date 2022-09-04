# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)

fluidPage(
  titlePanel("CMC Seoul NGS Ion Torrent"),
  
  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(4,
           textInput("sym", "Hugo_Symbol", "TP53")
           ),
    ),
  # Create a new row for the table.
  DT::dataTableOutput("table"),
  
  downloadButton("downloadData", "Download")
)
