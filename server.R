library(shiny)
shinyServer(function(input, output){
     
     dataInput <- reactive({
                data <- (input$AmyHoursIn*input$AmyRate
                         + input$ShareholderBill 
                         - input$Xpert 
                         + input$HighQ
                         + input$AttyGroup
                         - input$AFLAC
                         - input$TriNet
                         - input$Amazon
                         - input$HighQIn
                         + (input$AmyProjectedHrs*input$AmyProjectedRate)
                         + (input$supportHrs*input$supportRate)
                         - input$XpertRevProj
                         - input$templateUse
                         + (input$upkeepHours*input$attyRate*input$prorataKM)
                         + (input$HighQOutfees*input$prorataHighQKM))
                data
     })
     
     pricing1 <- reactive({
          p1 <- input$price1*input$numSubs1
          p1
     })
     
     pricing2 <- reactive({
          p2 <- input$price2*input$numSubs2
          p2
     })
     
     pricing3 <- reactive({
          p3 <- input$price3*input$numSubs3
          p3
     })
     
     pricing1 <- reactive({
          p1 <- input$price1*input$numSubs1
          p1
     })
     
     pricing4 <- reactive({
          p4 <- input$price4*input$numSubs4
          p4
     })
     
     pricing5 <- reactive({
          p5 <- input$price5*input$numSubs5
          p5
     })
     
     pricing6 <- reactive({
          p6 <- input$price6*input$numSubs6
          p6
     })
     output$plot <- renderPlot({
          r1 <- pricing1()
          r2 <- pricing2()
          r3 <- pricing3()
          r4 <- pricing4()
          r5 <- pricing5()
          r6 <- pricing6()
          barplot(c(r1,r2,r3,r4,r5,r6), ylim=c(0,800000), col = heat.colors(6), names.arg=c("Pricing 1", "Pricing 2", "Pricing 3", "Pricing 4", "Pricing 5", "Pricing 6"), main = "Pricing Options Given Cost Assumptions/Projections", ylab = "Revenue")
          goal <- dataInput()
          abline(h=goal, col="red", lwd="3")
     })
})