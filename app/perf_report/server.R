server <- function(input, output) { 
  
  output$table <- DT::renderDataTable(DT::datatable(rownames=TRUE,{
    data <- meta_data
  }))
  

  
  output$experiments <- renderInfoBox({
    dim_data <- nrow(meta_data)
    infoBox(
      "Total Experiments", dim_data[1], color = "blue", icon=icon('flask')
    )
  })
  
  output$hardware <- renderInfoBox({
    hwd_count <- length(unique(meta_data$Hardware))
    infoBox(
      "Hardware Configurations", hwd_count, color = "blue",  icon=icon('server')
    )
  })
  
  output$release <- renderInfoBox({
    release <- unique(meta_data$Release)
    infoBox(
      "Cureent Release", release, color = "blue", icon=icon('star')
    )
  })
  
  output$box_plot <- renderPlotly({
    meta_data$total_time_taken_in_minutes <- meta_data$Total_Time/60
    plot_ly(meta_data, x=~total_time_taken_in_minutes, color = ~Dataset_Size, type = "box")
  })
  
  
}
