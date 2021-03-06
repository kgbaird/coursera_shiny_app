## install.packages("shiny")
library(shiny)
library(datasets)
require(graphics)

shinyUI(
	fluidPage(
		headerPanel(
			img(src = "ddp.jpg")
			,"Visualizing Simple Linear Regression"
			)
		# description and input
		,sidebarPanel(
			h3('Input Panel:')
			,p('Here we can play with mtcars dataset.')
			,p('Select the predictor variable with mpg as outcome:')
			,selectInput(
				'x'
				,label='Predictor'
				,selected='cyl'
				,choices=names(mtcars)
				)
			,p('Select a color for the regression line.')
			,selectInput(
				'color'
				,label='Color'
				,choices=palette()
				)
			,h3('Usage Notes:')
			,p(
				"This project uses the `mtcars` dataset to plot the",
				"regression model using two variables of this dataset:",
				"one as predictor, what we have to choose, and the",
				"other is 'mpg' as the outcome."
				)		
			,p(
				"It is simple to use and when the predictor is selected"
				,"the plot is updated putting the new fit."
				)
			)
		# plot and output
		,mainPanel(
			div(
				h2(
					"Visualizing Simple Linear Regression"
					,style="color:#ff6600;margin:-65px 0px 10px 20px;"
					)
				)
			,h4('Summary of Selected Variable')
			,h4(verbatimTextOutput("summary"))
			,h4(textOutput('text'))
			,plotOutput('myPlot')
			)
		)
	)
