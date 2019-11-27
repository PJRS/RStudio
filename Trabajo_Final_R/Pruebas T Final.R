## Para temas especiales
install.packages("prettydoc")
library(prettydoc)



library(plyr)
library(ggplot2)

quakes$level <- cut(quakes$depth, 5, 
                    labels=c("Very Shallow", "Shallow", "Medium", "Deep", "Very Deep"))

quakes.summary <- ddply(quakes, .(level), summarise, mag=round(mean(mag), 1))

ggplot(quakes, aes(x=long, y=lat)) + 
  geom_point(aes(colour=mag)) + 
  geom_text(aes(label=mag), data=quakes.summary, x=185, y=-35) +
  facet_grid(~level) + 
  coord_map()


library(ggplot2)

ggplot(data = quakes, aes(x = lat,y = long,colour = stations)) + geom_point()

g = ggplot(data = quakes,
           aes(x = lat,y = long,colour = stations)) +
  geom_point()

g + theme(text = element_text(size = 20))

gbig = g + theme(axis.text = element_text(size = 18),
                 axis.title = element_text(size = 20),
                 legend.text = element_text(size = 15),
                 legend.title = element_text(size = 15))
gbig


transparent_legend =  theme(
  legend.background = element_rect(fill =  "transparent"),
  legend.key = element_rect(fill = "transparent",
                            color = "transparent")
)
gbig = gbig + theme(legend.position = c(0.3, 0.35)) + transparent_legend + 
  ylim(c(160, max(quakes$long))) + ggtitle("Distribución Espacial de Estaciones") + 
  xlab("Latitud") + ylab("Longitud") + guides(colour = guide_colorbar(title =
  "Numero\nde Estaciones\nReportando",  title.hjust = 0.5,  title.position = "left")) 
gbig



# Library
library(leaflet)

# load example data (Fiji Earthquakes) + keep only 100 first lines
data(quakes)
quakes =  head(quakes, 200)

# Create a color palette with handmade bins.
mybins=seq(4, 6.5, by=0.5)
mypalette = colorBin( palette="YlOrBr", domain=quakes$mag, na.color="transparent", bins=mybins)

# Final Map
leaflet(quakes) %>% 
  addTiles()  %>% 
  setView( lat=-27, lng=170 , zoom=4) %>%
  addProviderTiles("Esri.WorldImagery") %>%
  addCircleMarkers(~long, ~lat, 
                   fillColor = ~mypalette(mag), fillOpacity = 0.7, color="white", radius=8, stroke=FALSE
  ) %>%
  addLegend( pal=mypalette, values=~mag, opacity=0.9, title = "Magnitude", position = "bottomright" )

#######


library(shiny)
library(leaflet)
library(RColorBrewer)


ui <- bootstrapPage(
  tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  leafletOutput("map", width = "100%", height = "100%"),
  absolutePanel(top = 10, right = 10,
                sliderInput("range", "Magnitudes", min(quakes$mag), max(quakes$mag),
                            value = range(quakes$mag), step = 0.1
                ),
                selectInput("colors", "Color Scheme",
                            rownames(subset(brewer.pal.info, category %in% c("seq", "div")))
                ),
                checkboxInput("legend", "Show legend", TRUE)
  )
)

server <- function(input, output, session) {
  
  # Reactive expression for the data subsetted to what the user selected
  filteredData <- reactive({
    quakes[quakes$mag >= input$range[1] & quakes$mag <= input$range[2],]
  })
  
  # This reactive expression represents the palette function,
  # which changes as the user makes selections in UI.
  colorpal <- reactive({
    colorNumeric(input$colors, quakes$mag)
  })
  
  output$map <- renderLeaflet({
    # Use leaflet() here, and only include aspects of the map that
    # won't need to change dynamically (at least, not unless the
    # entire map is being torn down and recreated).
    leaflet(quakes) %>% addTiles() %>%
      fitBounds(~min(long), ~min(lat), ~max(long), ~max(lat))
  })
  
  # Incremental changes to the map (in this case, replacing the
  # circles when a new color is chosen) should be performed in
  # an observer. Each independent set of things that can change
  # should be managed in its own observer.
  observe({
    pal <- colorpal()
    
    leafletProxy("map", data = filteredData()) %>%
      clearShapes() %>%
      addCircles(radius = ~10^mag/10, weight = 1, color = "#777777",
                 fillColor = ~pal(mag), fillOpacity = 0.7, popup = ~paste(mag)
      )
  })
  
  # Use a separate observer to recreate the legend as needed.
  observe({
    proxy <- leafletProxy("map", data = quakes)
    
    # Remove any existing legend, and only if the legend is
    # enabled, create a new one.
    proxy %>% clearControls()
    if (input$legend) {
      pal <- colorpal()
      proxy %>% addLegend(position = "bottomright",
                          pal = pal, values = ~mag
      )
    }
  })
}

shinyApp(ui, server)


#### Tablas

install.packages("kableExtra")
library(knitr)
library(kableExtra)
dt <- quakes

kable(dt, "latex")

kable(dt, "latex", booktabs = T)



find.package("devtools")
install.packages("devtools")
library(devtools)


remotes::install_github("miraisolutions/compareWith")


#logo sin Shiny
#<script>
#   $(document).ready(function() {
#     $head = $('#header');
#     $head.prepend('<img src=\"Recursos/logoEAE.png\" style=\"float: right;width: 300px;\"/>')
#   });
#</script>

#Otra manera de poner el logo sin Shiny
#```{js logo-js, echo=FALSE}
#$(document).ready(function() {
#  $('#header').parent().prepend('<div id=\"logo\"><img src=\"Recursos/logoEAE.png\" #style=\"position:absolute; top:0; right:0; padding:20px; height:120px\"></div>');
#  $('#header').css('margin-right', '120px')
#});
#```
