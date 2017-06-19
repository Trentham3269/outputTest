This bash script is intended to compare the outputIds in Shiny ui.R files with the output$slots defined in Shiny server.R files.

Logically, given that Shiny apps are written in R, an R version of this script will follow. 

## Usage
Place this file in your shinyApp's directory and run:
```
$ bash outputTest.sh
```
## Notes
* This script greps the string "outputId" so therefore Shiny outputs in ui require the syntax:
```
plotOutput(outputId = "plot")
```
NOT 
```
plotOutput("plot")
```
* Cleanest bash output will be possible with properly assigned ouput$slots in server.R:
```
output$plot <- plotOutput({...})
```
NOT 
``` 
output$plot<-plotOutput({...}) OR output$plot = plotOutput({...})
```