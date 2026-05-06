### <mark style="background: #04FF00A6;">Why Visualisation Design Matters</mark>  

Visualization is not just about creating charts.  

<mark style="background: #04FF00A6;">Design choices affect:</mark>  
- what patterns people see  
- what conclusions they draw  
- how trustworthy the data appears  

<mark style="background: #04FF00A6;">Three responsibilities:</mark>  
- Represent the data correctly  
- Make visualisations accessible  
- Communicate uncertainty  

A good visualisation communicates what the data shows, how reliable it is, and why it matters.

### <mark style="background: #04FF00A6;">Lecture Overview</mark>  

Today we will discuss three aspects of responsible visualisation design:  
- <mark style="background: #04FF00A6;">Visual Encoding</mark> – how data values are mapped to visual properties  
- <mark style="background: #04FF00A6;">Accessibility</mark> – ensuring visualizations can be interpreted by all users  
- <mark style="background: #04FF00A6;">Annotations</mark> – guiding the viewer to the important insights

![[Pasted image 20260313160132.png]]

### <mark style="background: #04FF00A6;">Data Visualisation Pipeline</mark>

<mark style="background: #04FF00A6;">Data Collection:</mark>
- Gather raw data from various sources (surveys, sensors, databases, etc.).
- <mark style="background: #04FF00A6;">Example:</mark> Collecting sales data from a company's database.

<mark style="background: #04FF00A6;">Data Cleaning:</mark>
- Handle missing values, correct errors, and remove outliers to ensure data quality. 
- <mark style="background: #04FF00A6;">Example:</mark> Removing duplicate entries or correcting date formats in the dataset.  

<mark style="background: #04FF00A6;">Data Transformation:</mark>  
- Reshape, aggregate, or pivot data to create meaningful structures for analysis. 
- <mark style="background: #04FF00A6;">Example:</mark> Converting categorical data into numerical form for analysis, or pivoting data from wide to long format.  

<mark style="background: #04FF00A6;">Exploratory Data Analysis (EDA):</mark>  
- Analyse the data using summary statistics, trends, and patterns to inform decisions on which visualisations to create.
- <mark style="background: #04FF00A6;">Example:</mark> Visualising distribution of sales by region to identify trends.

<mark style="background: #04FF00A6;">Choosing the Right Visualisation</mark>  
- Select an appropriate chart or graph type based on the data and the story you want to tell.  
- <mark style="background: #04FF00A6;">Example:</mark> Using a line graph to show trends over time or a bar chart for comparing categories.  

<mark style="background: #04FF00A6;">Design and Styling:</mark>
- Customise visual elements such as colours, labels, and titles to improve clarity and aesthetics. 
- <mark style="background: #04FF00A6;">Example:</mark> Adding a title, axis labels, and a legend to a bar chart for clarity. 

<mark style="background: #04FF00A6;">Interactive Elements (Optional):</mark>  
- Add interactive features like tooltips, zooming, and filters to enhance user engagement.
- <mark style="background: #04FF00A6;">Example:</mark> Adding a hover effect on a map to display additional information about each region.  

<mark style="background: #04FF00A6;">Review and Refinement:</mark>  
- Ensure the visualization accurately represents the data and effectively communicates insights.
- <mark style="background: #04FF00A6;">Example:</mark> Reviewing a dashboard to check for clarity and coherence of the message.  

<mark style="background: #04FF00A6;">Publication and Sharing:</mark>  
- Share the final visualisation through reports, websites, or interactive platforms. 
- <mark style="background: #04FF00A6;">Example:</mark> Publishing the interactive chart on a website for public access

### <mark style="background: #04FF00A6;">What is a Dimension?</mark> 

A variable that contributes to the structure of a visualisation  

Defines how data is organised and displayed  

<mark style="background: #04FF00A6;">Types:</mark>  
- <mark style="background: #04FF00A6;">Categorical:</mark> Groups data (e.g., country, product type)  
- <mark style="background: #04FF00A6;">Numerical:</mark> Quantitative values (e.g., sales, population) 
- <mark style="background: #04FF00A6;">Spatial:</mark> Geographic data (e.g., latitude, longitude)  
- <mark style="background: #04FF00A6;">Temporal:</mark> Time-based (e.g., year, month, hour)  
- <mark style="background: #04FF00A6;">Hierarchical:</mark> Structured data (e.g., organization charts)

Dimensions determine how we <mark style="background: #04FF00A6;">encode data visually</mark>

### <mark style="background: #04FF00A6;">What is Encoding?</mark>  

<mark style="background: #04FF00A6;">Encoding</mark> = mapping data values to visual properties.  

Determines how information is visually represented  

Helps communicate insights effectively  

Choosing the right encoding improves clarity and insight  

Use multiple encoding methods effectively to convey  
meaning

### <mark style="background: #04FF00A6;">Dimension v Encoding</mark>

Dimensions describe the variables in the dataset.  

Encoding determines how those variables are represented visually.

### <mark style="background: #04FF00A6;">Common Encoding Methods</mark>  

<mark style="background: #04FF00A6;">Position:</mark> Used in scatter plots, bar charts, maps  

<mark style="background: #04FF00A6;">Size:</mark> Used in bubble charts, tree-maps  

<mark style="background: #04FF00A6;">Colour:</mark> Used in heatmaps, choropleth maps  

<mark style="background: #04FF00A6;">Shape:</mark> Used to distinguish categories  

<mark style="background: #04FF00A6;">Orientation:</mark> Used in slope charts, rotated bar charts  

<mark style="background: #04FF00A6;">Motion:</mark> Used in animated visualisations

### <mark style="background: #04FF00A6;">Why encoding matters?</mark>  

Human perception interprets visual variables differently.  

Different visual encodings allow people to judge values with different levels of accuracy.  

Some visual comparisons are easier for the human brain than others.  

<mark style="background: #04FF00A6;">Approximate perceptual accuracy (most accurate → least accurate):</mark>  
1. Position on a common scale  
2. Length  
3. Angle / slope  
4. Area  
5. Volume  
6. Colour intensity

### <mark style="background: #04FF00A6;">Multi-dimensional Data</mark> 

Real datasets often have many variables.  

<mark style="background: #04FF00A6;">Techniques:</mark>  
- scatterplot matrix  
- faceting  
- colour encoding  
- size encoding  
- parallel coordinates  

Humans struggle to interpret more than <mark style="background: #04FF00A6;">3–4 visual encodings simultaneously</mark>.

### <mark style="background: #04FF00A6;">Why Accessibility Matters</mark>  

<mark style="background: #04FF00A6;">Accessibility improves:</mark>  
- usability  
- clarity  
- ethical communication  

<mark style="background: #04FF00A6;">Important standards:</mark>  
- WCAG - Web Content Accessibility Guidelines  
- (https://www.w3.org/WAI/standards-guidelines/wcag/) 
- ADA – Americans with Disabilities Act  
- (https://www.w3.org/WAI/standards-guidelines/wcag/)

### <mark style="background: #04FF00A6;">Common Problems</mark>  

<mark style="background: #04FF00A6;">Include:</mark>
- Over-reliance on colour
- Low contrast and small fonts
- Cluttered and complex visuals
- Lack of assistive technology support

### <mark style="background: #04FF00A6;">Best Practices: Colour</mark>

Use colour-blind friendly palettes

<mark style="background: #04FF00A6;">the {viridis} package in R:</mark>  
- colour blind-friendly and suitable for grayscale printing  
- commonly used in ggplot2, base R, and leaflet visualizations.  
- includes palettes: "viridis", "magma", "plasma", "inferno", "cividis", "turbo", etc.  

<mark style="background: #04FF00A6;">the {RColorBrewer} package:</mark>
- originally developed for cartography but widely used in data visualisation.  
- includes palettes like "Blues", "Reds", "Set1", "Paired", "Spectral", etc.  

Avoid red-green combinations.  

Avoid low contrast colour combinations

### <mark style="background: #04FF00A6;">Best Practices: Contrast</mark>  

Ensure sufficient contrast between text and background.  

Accessibility guideline from WCAG - Ensure contrast ratios of at least 4.5:1  

<mark style="background: #04FF00A6;">Good contrast improves readability for:</mark>  
- users with low vision  
- colour-blind users  
- viewers on low-quality displays  

For large text (18pt or 14pt bold), a 3:1 ratio is acceptable. 

Higher contrast (e.g., 7:1) is preferable for better readability.

![[Pasted image 20260313163310.png]]

### <mark style="background: #04FF00A6;">Best Practices: Contrast</mark>

Tools listed below  

<mark style="background: #04FF00A6;">WebAIM Contrast Checker:</mark>
- WebAIM Contrast Checker  
- https://webaim.org/resources/contrastchecker/  
- Enter foreground and background colours.  
- Checks if contrast meets WCAG 2.1 (AA & AAA) standards.  

<mark style="background: #04FF00A6;">Color Oracle (Desktop App):</mark>
- https://colororacle.org/  
- Simulates colour blindness system-wide on Windows, Mac, and Linux.  

<mark style="background: #04FF00A6;">Coblis simulator:</mark>
- https://www.color-blindness.com/coblis-color-blindness-simulator/  
- Upload an image and view how it appears to different types of colour blindness  

<mark style="background: #04FF00A6;">Contrast Ratio</mark>  
- https://www.siegemedia.com/contrast-ratio  
- Provides a quick pass/fail result.  

<mark style="background: #04FF00A6;">In R:</mark> Simulate Colour Blindness with {dichromat}

### <mark style="background: #04FF00A6;">Best Practices: Readability</mark>  

<mark style="background: #04FF00A6;">Use direct labelling instead of legends:</mark>  
- sans-serif fonts  
- font size ≥14  
- Example uses Lato  

<mark style="background: #04FF00A6;">Provide alternative text descriptions:</mark>
- Tool tips  
- Embed explanations in markdown  
- ``![A bar chart showing categories A, B, and C with values 40, 70, and 55. Colores: green, orange, and blue.](bar_chart.png)``  

Minimize Clutter  

Maximise Readability  

<mark style="background: #04FF00A6;">Avoid:</mark>  
- dense legends  
- tiny labels

![[Pasted image 20260313163604.png]]

### <mark style="background: #04FF00A6;">Details matter</mark>  

<mark style="background: #04FF00A6;">Small design choices can significantly affect how viewers interpret a visualisation:</mark>  
- Worrying about tiny details in graphs...  
- ...makes them easier for your audience to understand 
- ...improves their beauty 
- ...enhances the truth

### <mark style="background: #04FF00A6;">What Are Annotations?</mark>  

Annotations help explain what the viewer should notice.  

<mark style="background: #04FF00A6;">They convert:</mark> exploratory charts → explanatory visualisations  

<mark style="background: #04FF00A6;">Examples:</mark>  
- Titles and captions  
- Data point labels  
- Highlighting  
- Explanatory notes

### <mark style="background: #04FF00A6;">Including text on a plot</mark>  

<mark style="background: #04FF00A6;">Titles, subtitles, captions, etc:</mark> labs(title = "blah", subtitle = "blah", caption = "blah")  

<mark style="background: #04FF00A6;">Labelling actual data points:</mark>  
- ``geom_text(), geom_label(), geom_text_repel(), etc.``  
- Using ``ggrepel`` prevents label overlap.  

<mark style="background: #04FF00A6;">And adding arbitrary annotations:</mark> ``annotate()``

### <mark style="background: #04FF00A6;">Highlighting Instead of Labelling</mark>

This can emphasize key patterns.  

<mark style="background: #04FF00A6;">Example:</mark>  
- change colour  
- increase line width  
- increase opacity

### <mark style="background: #04FF00A6;">Bad Example</mark>  

Label actual data points  

```R
library(gapminder)  
library(tidyverse)  
gapminder_europe <- gapminder |>  
filter(year == 2007,  
continent == "Europe")  

ggplot(gapminder_europe, aes(x = gdpPercap, y = lifeExp)) +  
geom_point() + 
geom_text(aes(label = country))
```

![[Pasted image 20260313163932.png]]

### <mark style="background: #04FF00A6;">Improvement</mark> 

Label points using geom_label  
```R
library(gapminder)  
library(tidyverse)  
library(ggrepel)  

gapminder_europe <- gapminder |> filter(year == 2007, continent == "Europe")  

ggplot(gapminder_europe, aes(x = gdpPercap, y = 
lifeExp)) + geom_point() +  

geom_label(aes(label = country)) +  
labs(x = "GDP per Capita", y = "Life  
Expectancy", title = "GDP vs Life  
Expectancy in Europe (2007)") +  
theme_minimal()
```

![[Pasted image 20260313164050.png]]

### <mark style="background: #04FF00A6;">Selected Labels</mark>

Label points using ggrepel  
```R

ggplot(gapminder_europe, aes(x = gdpPercap,  
y = lifeExp)) +  
geom_point(aes(color = should_be_labeled)) +  
geom_label_repel(  
data = filter( gapminder_europe,  
should_be_labeled == TRUE ),  
aes(label = country, fill =  
should_be_labeled), color = "white" ) +  
scale_color_manual(values = c("grey50",  
"red")) +  
scale_fill_manual(values = c("red")) +  
guides(color = "none", fill = "none")
```

![[Pasted image 20260313164320.png]]

### <mark style="background: #04FF00A6;">Highlight non-text elements</mark>  

```R
gapminder_highlighted <- gapminder |>  
mutate(is_oceania =  
ifelse(continent == "Oceania",  
TRUE, FALSE))  
ggplot(gapminder_highlighted,  
aes(x = year, y = lifeExp,  
group = country,  
color = is_oceania,  
linewidth = is_oceania)) +  
geom_line() +  
scale_color_manual(values = c("grey70",  
"red")) +  
scale_linewidth_manual(values = c(0.1,  
0.5)) +  
guides(color = "none", linewidth = "none")  
+  
theme_minimal()
```

![[Pasted image 20260313164403.png]]

### <mark style="background: #04FF00A6;">Adding Annotation</mark> 

```R
ggplot(gapminder_europe, aes(x = gdpPercap, y = 
lifeExp)) +  
geom_point() +  
annotate(geom = "text",  
x = 40000, y = 76,  
label = "Look Here !")
```

![[Pasted image 20260313164446.png]]

### <mark style="background: #04FF00A6;">Adding Annotation (label)</mark>  

```R
ggplot(gapminder_europe,  
aes(x = gdpPercap, y =  
lifeExp)) +  
geom_point() +  
annotate(geom = "label",  
x = 40000, y = 76,  
label = "Look Here !")
```

![[Pasted image 20260313164521.png]]

### <mark style="background: #04FF00A6;">Adding Annotation (any geom works)</mark>  

```R
ggplot(gapminder_europe, aes(x = gdpPercap, y = lifeExp)) +  
geom_point() +  
annotate(geom = "rect",  
xmin = 30000, xmax = 50000,  
ymin = 78, ymax = 82,  
fill = "red", alpha = 0.2) +  
annotate(geom = "label",  
x = 40000, y = 76.5,  
label = "Rich and long-living") +  
annotate(geom = "segment",  
x = 40000, xend = 40000,  
y = 76.8, yend = 77.8,  
arrow = arrow(  
length = unit(0.1, "in")))
```

![[Pasted image 20260313164609.png]]

### <mark style="background: #04FF00A6;">Key Takeaways</mark>  

Responsible visualization design requires:  

<mark style="background: #04FF00A6;">Appropriate encoding:</mark> Choose visual representations that match human perception.  

<mark style="background: #04FF00A6;">Accessible design:</mark> Ensure charts are readable and interpretable by diverse audiences.  

<mark style="background: #04FF00A6;">Effective annotation:</mark> Guide the viewer to the most important insights.  

Good visualisations do not just show data —they help viewers <mark style="background: #04FF00A6;">understand it clearly</mark>.