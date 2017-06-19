This bash script is intended to compare the outputIds in Shiny ui.R files with the output$slots defined in Shiny server.R files.

Logically, given that Shiny apps are written in R, an R version of this script will follow. 

## Usage
Place this file in your shinyApp's directory and run:
```
$ bash outputTest.sh
```
Note that this script greps the string "outputId" so therefore Shiny outputs require the following example syntax:
```
plotOutput(outputId = "plot")
```
NOT 
```
plotOutput("plot")
```
