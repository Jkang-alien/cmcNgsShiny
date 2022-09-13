library(ggplot2)
library(tidyverse)
library(pins)
function(input, output) {
  board <- board_folder("~/board")
  
  variantData <- board |> pin_read("data")|>
    select(Tumor_Sample_Barcode,
           Hugo_Symbol,
           starts_with("HGVS"),
           Variant_Type)|>
    rename(`NGS ID` = Tumor_Sample_Barcode)
  
  # Filter data based on selections
  variantInput <- reactive({
    dataset <- variantData
      if (input$sym1 != "All") {
        dataset <- variantData|>
          filter(Hugo_Symbol == input$sym1)
      }
    dataset
  })
  
  output$table1 <- DT::renderDataTable(
    DT::datatable({
    variantInput()
    })
    )
  
  output$downloadVariant <- downloadHandler(
    filename = "varinat_data.csv",
    content = function(file) {
      write.csv(variantInput(), file)
    }
  )
  
  caseInput <- reactive({
    caseData <- iris
    if (input$sym2 != "All") {
      caseData <- caseData[caseData$Species == input$sym2,]
    }
    caseData
  })
  
  output$table2 <- DT::renderDataTable(
    DT::datatable({
      caseInput()
      })
  )
  
  output$downloadCase <- downloadHandler(
    filename = "case_data.csv",
    content = function(file) {
      write.csv(caseInput(), file)
    }
  )
}