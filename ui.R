shinyUI(pageWithSidebar(
        headerPanel("Historical Stock Price Comparison"),
        sidebarPanel(
                textInput(inputId="text1", label = "Stock1"),
                textInput(inputId="text2", label = "Stock2"),
                dateInput("dateStart", "Start Date:", value = '2007-01-03', min = '2007-01-03', max = Sys.Date()-2, startview = "year"),
                dateInput("dateEnd", "End Date:", value = Sys.Date(), min = '2007-01-03', max = Sys.Date(), startview = "year"),
                submitButton('Submit'),
                h4('Documentation:'),
                p('This is a tool to get histocial stock prices for publicly traded companies on NASDAQ or NYSE. You can enter two stock tickers (e.g., AMZN, and YHOO), and select the time frame that you want to look at. At least 3 trading days should be selected. Default is 2007 to present, but you can select any time between 2007 to current. (After selecting a date, click anywhere in the black space to proceed) After clicking the submit button, you will see the average closing prices, standard deviation of the closing prices for the stocks in the time frame you select. Two time series charts will also be generated for the closing prices. At the bottom, the correlation of the two stocks in terms of the closing prices for that time period will also be calculated so that you can compare stocks and see how correlated they were.')
        ),
        mainPanel(
                h3(textOutput('text1')),
                h4('close price average:'),
                h4(textOutput('text3')),
                h4('close price standard deviation:'),
                h4(textOutput('text4')),
                plotOutput('chart1'),
                h3(textOutput('text2')),
                h4('close price average:'),
                h4(textOutput('text5')),
                h4('close price standard deviation:'),
                h4(textOutput('text6')),
                plotOutput('chart2'),
                h4('correlation of the close prices of the two stocks:'),
                h4(textOutput('text7'))
        )
))