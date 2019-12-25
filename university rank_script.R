library(ggplot2)
library(readxl)
library(tidyr)
library(DT)
library(htmltools)
d<-read_excel("~/University/data/university rank.xlsx")

#	https://github.com/rstudio/DT

datatable(d, width="auto",rownames = FALSE,
          colnames=c("№"= 1,
                     "ВНЗ"= 2,
                     "Місто"= 3,
                     "Оцінка якості науково-педагогічного потенціалу Iнп"= 4,
                     "Оцінка якості навчання IН"= 5,
                     "Оцінка міжнародного визнання IМВ"= 6,
                     "Оцінка інтегрального показника діяльності ВНЗ, IЗ"= 7),
          
          extensions = c('Buttons','FixedHeader'),               
          options=list(pageLength =20,
                       lengthMenu = c(10,20,50,100,200),
                       fixedHeader = TRUE,                             
                       language = list(url = '//cdn.datatables.net/plug-ins/1.10.19/i18n/Ukrainian.json'),
                       searchHighlight = TRUE,
                       columnDefs = list(list(width = '400px', targets=1),
                                         list(className = 'dt-center',targets=0)),
                       dom = 'Blfrtip',
                       buttons = list( 'csv', 'excel', 'pdf', 'print')),
          caption = htmltools::tags$caption(
            style = 'caption-side: bottom; text-align: right;color:grey; ',
            htmltools::withTags(
              div(HTML('Джерело даних: <a href="http://www.euroosvita.net"
                       style="color:grey; text-decoration: none" title="www.euroosvita.net"
                       target="_blank"> www.euroosvita.net<a>')))))%>%
  formatStyle("№", 
              fontSize = '16px')%>%
  formatStyle("ВНЗ",
              fontSize = '12px')%>%
  formatStyle("Місто",
              fontWeght="bold",
              fontSize = '12px')%>%
  formatStyle("Оцінка якості науково-педагогічного потенціалу Iнп",
              fontSize = '16px',
              fontWeght="bold",
              background = styleColorBar(d$`Оцінка якості науково-педагогічного потенціалу Iнп`, "#97b5cf"),
              backgroundSize = '95% 20px',
              backgroundRepeat = 'no-repeat',
              backgroundPosition = 'center')%>%
  formatStyle("Оцінка якості навчання IН",
              fontSize = '16px',
              background = styleColorBar(d$`Оцінка якості навчання IН`, "#c3bba8"),
              fontWeght="bold",
              backgroundSize = '95% 20px',
              backgroundRepeat = 'no-repeat',
              backgroundPosition = 'center')%>%
  formatStyle("Оцінка міжнародного визнання IМВ",
              fontSize = '16px',
              background = styleColorBar(d$`Оцінка міжнародного визнання IМВ`, "#c7d4d9"),
              backgroundSize = '95% 20px',
              fontWeght="bold",
              backgroundRepeat = 'no-repeat',
              backgroundPosition = 'center')%>%
  formatStyle("Оцінка інтегрального показника діяльності ВНЗ, IЗ",
              fontSize = '16px',
              background = styleColorBar(d$`Оцінка інтегрального показника діяльності ВНЗ, IЗ`, "#c7d4b6"),
              backgroundSize = '95% 20px',
              fontWeght="bold",
              backgroundRepeat = 'no-repeat',
              backgroundPosition = 'center')


