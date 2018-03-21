source('charts_ui.R')

side_bar_menu <- sidebarMenu(
  menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
  menuItem("Charts", tabName = "charts", icon = icon("bar-chart")),
  menuItem("Data", tabName = "data", icon = icon("bar-chart"))
)

dash_body <- fluidRow(valueBoxOutput("release"),
                      valueBoxOutput("experiments"),
                      valueBoxOutput("hardware"))

widgets_body <- fluidRow(h2("Widgets tab content"))
data_body <- fluidRow(DT::dataTableOutput("table"))


body <- tabItems(tabItem(tabName = "dashboard", dash_body),
                 tabItem(tabName = "charts", chart_ui),
                 tabItem(tabName = "data", data_body))


dashboardPage(skin = "black",
  dashboardHeader(title = "SystemML Performance"),
  dashboardSidebar(collapsed=TRUE, side_bar_menu),
  dashboardBody(body)
)
