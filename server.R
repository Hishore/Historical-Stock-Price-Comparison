library(shiny)
library(quantmod)
stockPrice <- function(ticker, Date) {
        stockObj<-getSymbols(ticker,auto.assign=FALSE)
        stockObj[index(stockObj)==Date,4]
}
allPrice <- function(ticker, Start, End) {
        stockObj<-getSymbols(ticker,auto.assign=FALSE)
        stockObj[index(stockObj)>=Start & index(stockObj)<=End,4]
}
average <- function(ticker, Start, End){
        stockObj<-getSymbols(ticker,auto.assign=FALSE)
        p<-stockObj[index(stockObj)>=Start & index(stockObj)<=End,4]
        round(mean(p),2)
}
standardD <- function(ticker, Start, End){
        stockObj<-getSymbols(ticker,auto.assign=FALSE)
        p<-stockObj[index(stockObj)>=Start & index(stockObj)<=End,4]
        round(sd(p),2)        
}
corr <- function(ticker1, ticker2, Start, End){
        stockObj1<-getSymbols(ticker1,auto.assign=FALSE)
        p1<-stockObj1[index(stockObj1)>=Start & index(stockObj1)<=End,4]
        stockObj2<-getSymbols(ticker2,auto.assign=FALSE)
        p2<-stockObj2[index(stockObj2)>=Start & index(stockObj2)<=End,4]
        round(cor(p1,p2),2)        
}
shinyServer(
        function(input, output) {
                s1<-reactive({
                        validate(
                                need(try(getSymbols(input$text1,auto.assign=FALSE)), "Please enter valid ticker for the first stock")
                        )
                        input$text1
                })
                s2<-reactive({
                        validate(
                                need(try(getSymbols(input$text1,auto.assign=FALSE)), "Please enter valid ticker for the second stock")
                        )
                        input$text2
                })
                dt1<-reactive({
                        validate(
                                need(nrow(allPrice(s1(), input$dateStart, input$dateEnd))>2, "Please select at least 3 week days that markets were open")
                        )
                        input$dateStart
                })
                output$text1 <- renderText({s1()})
                output$text2 <- renderText({s2()})
                output$text3 <- renderText({average(s1(),dt1(),input$dateEnd)})
                output$text4 <- renderText({standardD(s1(),dt1(),input$dateEnd)})
                output$text5 <- renderText({average(s2(),dt1(),input$dateEnd)})
                output$text6 <- renderText({standardD(s2(),dt1(),input$dateEnd)})
                output$text7 <- renderText({corr(s1(),s2(),dt1(),input$dateEnd)})
                output$chart1 <- renderPlot({
                        plot(allPrice(s1(), dt1(), input$dateEnd), main=s1())
                })
                output$chart2 <- renderPlot({
                        plot(allPrice(s2(), dt1(), input$dateEnd), main=s2())
                })
       }
)