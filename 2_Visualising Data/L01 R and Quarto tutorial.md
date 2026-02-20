Installing packages:
```
install.packages("tidyverse")  
install.packages("gapminder")
```

Loading packages:
```
library(tidyverse)  
library(gapminder)
```

tidyverse: The tidyverse is a collection of R packages designed for data science that share a consistent philosophy and grammar. It provides tools for data import, cleaning, transformation, visualization, and modelling, making data analysis more readable, efficient, and reproducible. We will be using this all the time.  

gapminder: A data package with an excerpt from the Gapminder data. The main object in this package is the gapminder data frame or “tibble”

![[Pasted image 20260207165210.png]]

names - The Names of an Object

str - Compactly Display the Structure of an Arbitrary R Object

head - Return the First or Last Parts of an Object

nrow - The Number of Rows/Columns of an Array

summary - Object Summaries

### <mark style="background: #04FF00A6;">Create Simple Plots using ggplot</mark>

A. Create a base ggplot:  
```r
#data = tells ggplot what data from the current environment to use  
#x = and y = tells ggplot which variables from the data to plot on the x and y axis respectively  
ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap))
```

![[Pasted image 20260207170251.png]]


B. Add a geometry (geom) – point:

```R
ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap))+ geom_point()
```  

![[Pasted image 20260207170413.png]]

C. Change the colour of the geom:

```R
ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap))+ geom_point(colour="red")
``` 

![[Pasted image 20260207170539.png]]

D. Change the size of the geom:  

```R
ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap))+ geom_point(colour="red", size=2)
```  

What size = means:
- geom_point() draws points (circles by default).  
- size = 2 sets the radius of each point (in mm, roughly) to a fixed value.  
- If we set if outside the aes function - the size is constant for all points  
- If we set it using the aes function - size mapped to a variable  



E. Map aesthetics to the geom to change the colour for based on the continent of a country and the size based on the population – also add a level of transparency to the point (alpha = 0.7):

```r
ggplot(gapminder, aes(x = lifeExp, y = gdpPercap, colour = continent, size = pop)) + geom_point()
```

![[Pasted image 20260207170856.png]]

F. Change the shape of the point:  
```R
geom_point(shape = 17) # triangles  
geom_point(shape = 15) # squares  
geom_point(shape = 1) # hollow circles
```  

16 = solid circle (default)  
17 = solid triangle  
15 = solid square  
1 = hollow circle  
2 = hollow triangle  

e.g.  
```R
ggplot(gapminder, aes(x = lifeExp, y = gdpPercap, colour = continent, size = pop)) + geom_point(shape=15)
```

![[Pasted image 20260207171539.png]]

H. Change the colour of the lines:  
```R
ggplot(gapminder, aes(x = lifeExp, y = gdpPercap, linewidth = pop)) + geom_line(colour = "blue")
```

![[Pasted image 20260207171613.png]]

I. Change the colour of the lines based on the continent the country belongs to:  

```R
ggplot(gapminder, aes(x = lifeExp, y = gdpPercap, colour = continent, linewidth = pop )) + geom_line()
```

Note: geom_line() connects observations in the order they appear in the data. Because Gapminder contains multiple countries, this plot is not showing a meaningful time series — it is used here only to demonstrate how line geoms and aesthetics work.

![[Pasted image 20260207172311.png]]

Why are we setting the colour=continent in the aes rather than geom_line?
- When colour is set inside aes(), it is mapped to a variable in the data. This means different values of that variable produce different coloured lines.
- When colour is set inside geom_line(), it applies a single fixed colour to all lines and does not represent a data variable.

J. Change the palette of colours:  

```R
ggplot(gapminder, aes(x = lifeExp, y = gdpPercap, colour = continent, linewidth = pop )) + geom_line() + scale_colour_brewer(palette = "Set2")
```

![[Pasted image 20260207172824.png]]

scale_colour_brewer() is used in ggplot2 to control which colours are used when colour is mapped to a variable. It is based on ColorBrewer palettes, which were designed specifically for statistical graphics (not decoration). Common Sets:

<table>
	<tr>
		<th>Palette</th>
		<th>Notes</th>
	  </tr>
	  <tr>
		  <td>"Set1"</td>
		  <td> Bright, high contrast</td>
	  </tr>
	  <tr>
		  <td>"Set2"</td>
		  <td>Softer, pastel-like</td>
	  </tr>
	  <tr>
		  <td>"Set3"</td>
		  <td>Many categories, lower contrast</td>
	  </tr>
	  <tr>
		  <td>"Dark2"</td>
		  <td>Strong but less harsh than Set1</td>
	  </tr>
	  <tr>
		  <td>"Paired"</td>
		  <td>Designed for paired comparisons</td>
	  </tr>
  </table>


```R
gap_2007 <- filter(gapminder, year == 2007)

gdp_by_continent <- gap_2007 %>% group_by(continent) %>% summarise(mean_gdp = mean(gdpPercap))

ggplot(gdp_by_continent, aes(x = continent, y = mean_gdp, fill = continent))+ geom_col() + labs(title = "Average GDP per Capita by Continent (2007)", x = "Continent", y = "Average GDP per Capita")
```

![[Pasted image 20260207181753.png]]

CHECKPOINT TASK  
Modify the summary you created for 2007 so that instead of calculating the mean GDP per capita, you calculate the median GDP per capita for each continent – the function is median()

Then:  
1. Update your bar chart to use this new value.  
2. Change the plot title so it accurately describes what is being shown.


```R
median_gdp_by_continent <- gap_2007 %>% group_by(continent) %>% summarise(median_gdp = median(gdpPercap))

ggplot(median_gdp_by_continent, aes(x = continent, y = median_gdp, fill = continent))+ geom_col() + labs(title = "Average GDP per Capita by Continent (2007)", x = "Continent", y = "Average GDP per Capita")
```

![[Pasted image 20260207181959.png]]


### <mark style="background: #04FF00A6;">Step 8: Create a Faceted set of Charts</mark>

Top Ten Countries based on GDP per continent in 2007, shown as separate panels for each continent.  

A. Filter out the top ten countries in each continent into a new dataframe – use the slice_max function – n is the number of slices you want:  

```R
# From the 2007 data, group countries by continent,  
# then keep the top 10 countries with the highest GDP per capita in each continent  
top10 <- gap_2007 %>% group_by(continent) %>% slice_max(gdpPercap, n = 10)  
```

B. Build the plot including the facet_wrap, creating the facet based on the continent. Use coord_flip to make these horizontal as it is easier to read than vertical Include the show.legend = FALSE argument in the geom_col function to stop ggplot including a legend (i.e. colour key in each panel) :  

```R
# Create a bar chart showing GDP per capita for the top 10 countries in each continent  
# Use fill to colour bars by continent, facet the plot so each continent has its own panel,  
# flip the axes to make country names easier to read, and add informative labels 

ggplot(top10, aes(x =country, y = gdpPercap, fill = continent)) + geom_col(show.legend = FALSE) + facet_wrap(~ continent) + coord_flip() + labs(title = "Top 10 Countries by GDP per Capita in Each Continent (2007)", x = "Country", y = "GDP per Capita")
```

![[Pasted image 20260207182411.png]]

C. You will see that it is very cluttered.  

We need to adjust the facets so that each faceted graph is adjusted to accommodate the country names of each continent.  

We add the scales = “free_y” to the facet_wrap to allocate just enough space for each continent country names and avoid reserving space for countries that don’t exist in that panel  
```R
# Create a bar chart of the top 10 countries by GDP per capita in each continent  
# Facet the plot so each continent appears in its own panel  
# Use free_y scales so each facet allocates space only for its own country names  
# Flip the axes to improve readability of long country labels  
# Add a title and axis labels for clarity  

ggplot(top10, aes(x =country, y = gdpPercap, fill = continent)) + geom_col(show.legend = FALSE) + facet_wrap(~ continent, scales = "free_y") + coord_flip() + labs(title = "Top 10 Countries by GDP per Capita in Each Continent (2007)", x = "Country", y = "GDP per Capita")
```

![[Pasted image 20260207182745.png]]

D. This is better but the bars are not ordered. We can order the bars based on GDP per capita:  
```R
# Create a bar chart of the top 10 countries by GDP per capita in each continent  
# Reorder countries by GDP per capita so bars appear from lowest to highest  
# Facet the plot so each continent appears in its own panel with free y-scales  
# Flip the axes to make country names easier to read  
# Remove the legend since continent is already shown by the facets  

ggplot(top10, aes(x =reorder(country, gdpPercap), y = gdpPercap, fill = continent)) + geom_col(show.legend = FALSE) + facet_wrap(~ continent, scales = "free_y") + coord_flip() + labs(title = "Top 10 Countries by GDP per Capita in Each Continent (2007)", x = "Country", y = "GDP per Capita")
```  
Note: This reorders countries globally by GDP per capita (across all continents). This happens because reorder() is applied before faceting, using the full dataset rather than per-facet subsets. Reordering within each facet requires a more advanced approach, which we will cover later.

![[Pasted image 20260207182954.png]]

E. We can use a theme to adjust the labels: 
```R
# Create a bar chart of the top 10 countries by GDP per capita in each continent  
# Reorder countries by GDP per capita so bars are sorted within the plot  
# Facet the plot so each continent appears in its own panel, with free y-scales  
# Flip the axes to make long country names easier to read  
# Rotate the axis text to reduce label overlap and improve readability  
# Remove the legend since continent is already shown by the facets  

ggplot(top10, aes(x =reorder(country, gdpPercap), y = gdpPercap, fill = continent)) + geom_col(show.legend = FALSE) + facet_wrap(~ continent, scales = "free_y") + coord_flip() + labs(title = "Top 10 Countries by GDP per Capita in Each Continent (2007)", x = "Country", y = "GDP per Capita") + theme( axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
```  

![[Pasted image 20260207183150.png]]

Explanation:  

element_text() - Controls how that text is drawn.  
- angle = 90 - Rotates the text 90 degrees
- Labels go from horizontal → vertical
- Improves readability because there are many closely spaced labels, and when they are horizontal they overlap. Turning them vertical gives each label more space, so they don’t collide and are easier to read.  

hjust = 1 (horizontal justification) 
- Aligns the text relative to its anchor point  
- 1 means right-aligned 
- For rotated text, this helps the label sit on the tick mark instead of floating away.  

vjust = 0.5 (vertical justification)  
- Aligns text vertically
- 0.5 means centred
- This keeps the label visually balanced after rotation. 

After using coord_flip(), the country names appear on the x-axis internally, which is why we adjust axis.text.x.

CHECKPOINT TASK  
Starting with your faceted bar chart:  
1. Remove scales = "free_y" from facet_wrap() and re-run the code.  
2. Compare the result with the version that uses free y-scales.  
Write one sentence describing which version is easier to read and why

```R
ggplot(top10, aes(x =reorder(country, gdpPercap), y = gdpPercap, fill = continent)) + geom_col(show.legend = FALSE) + facet_wrap(~ continent) + coord_flip() + labs(title = "Top 10 Countries by GDP per Capita in Each Continent (2007)", x = "Country", y = "GDP per Capita") + theme( axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
```

![[Pasted image 20260207183554.png]]

The version where scales = free y was easier to read as it only showed the labels and data of the top 10 of each country, which made the data easier to interpret. Removing this caused the labels for each country to show and made the bar chart unreadable due to overlapping text and small bars of data

Step 9: Explore and Experiment  

Play around creating different types of plot, changing aesthetics and Quarto. There’s no single “right” plot — the goal is to explore how different geoms and aesthetics change what the data communicates.  

Try different geoms  
- Add multiple geoms to the same plot (e.g. points and lines).  

Change aesthetics  
- Map different variables to aesthetics: colour, size, fill  
- Try setting aesthetics inside vs outside aes() and see what changes.  

Experiment with scales:
- Change colour palettes using: scale_colour_brewer(), scale_fill_brewer()  
- Try different palettes (e.g. "Set1", "Set2", "Dark2").  

Modify labels and titles:
- Change the plot title and axis labels using labs().  
- Add a subtitle or caption.  
- Rename axes to make them more descriptive for a non-technical audience.  

Try faceting
- Use facet_wrap() with a different variable e.g. life expectancy - lifeExp  
- Compare facet_wrap() with and without scales = "free_y".  
- Notice how faceting changes how easy the plot is to read.  

Explore themes  
- Apply a built-in theme:  
- theme_minimal()  
- theme_bw()  
- theme_classic()  
- Adjust text size or angle using theme().  

Include your plots in Quarto  
- Add multiple plots to the same Quarto document.  
- Write one or two sentences explaining what each plot shows.  
- Change the code and re-render to see how Quarto updates the output.  
- Try running the code chunks within Quarto – the plots will not appear in the Plot window but below the code in the Script window
