# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)
library(tidyverse)
function(input, output) {
  
  datasetInput1 <- reactive(
    data|>
      select(Tumor_Sample_Barcode,
             Hugo_Symbol,
             starts_with("HGVS"),
             Variant_Type)|>
      filter(Hugo_Symbol == input$sym)
  )
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    dataset <- datasetInput1()
    }))
  
  output$downloadData <- downloadHandler(
    filename = "data.csv",
    content = function(file) {
      write.csv(datasetInput1(), file)
    }
  )
  
}