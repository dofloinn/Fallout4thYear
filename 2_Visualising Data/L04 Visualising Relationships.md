
You Must Understand the Following Concepts
1. What a Relationship Looks Like
	- Positive vs negative relationships
	- Linear vs nonlinear patterns
	- Strength via clustering
	- Identifying outliers

2. How Structure Shapes Perception
	- How aspect ratio changes perceived slope
	- Why (log) scaling may be necessary
	- Why structure determines what comparisons are easy

3. Regression as a Visual Layer
	- What geom_smooth(method = "lm") does
	- What se = TRUE adds
	- Why the uncertainty band widens at extremes
	- How regression reduces extraneous cognitive load
	- How regression imposes linear structure
	- You must be able to explain these verbally.
	
4. Overplotting - Understand:
	- What overplotting is
	- How density becomes hidden
	- Why patterns can appear weaker than they are
	- The perceptual effect of:
	- Transparency (alpha)
		- Faceting
		- Filtering
		- Aggregation

5. Encoding Decisions - You should understand:
	- Why position is stronger than colour
	- Why area encoding (bubble plots) is perceptually difficult
	- When scatterplots fail
	- When to change structure instead of adding decoration

6. Interaction vs Annotation
	- Be clear on the difference between:
	- Tooltips
	- Annotation


Understand their use and who drives their use.

Understand the cognitive trade-offs.

SECTION 2: Exploring Relationships in a New Dataset

### <mark style="background: #FFF503A6;">Step 0 - Setup you dataframe and review</mark>

Download the dataset from Brightspace - this week’s dataset contains data from the World Happiness report for multiple years (2015 - 2023.

Review the descriptor.

Load the data into a dataframe.

```C
install.packages("tidyverse")  
install.packages("zoo")

library(tidyverse)
library(plotly)
library(countrycode)

whr <- read_csv("merged_WHR.csv")
```


# Step 1 — Select Variables

From the dataset, identify:

One primary outcome variable e.g. happiness (Cantril Ladder score)

Two related continuous variables, for example:
- gdp_per_capita
- social_support
	- healthy_life_expectancy
	- freedom
	- perceptions_of_corruption

These will be your explanatory variables or predictors - concepts which can be considered to explain changes in happiness levels (can be used for pseudo prediction if level of change is a consistent pattern).

One categorical grouping variable, for example:
- region
- year

### <mark style="background: #04FF00A6;">MY WORK STEP 1</mark>

Primary outcome variable - country

Related continuous vars: happiness score


### <mark style="background: #04FF00A6;">Step 2 — Core Relationship Plot</mark>

Create one primary scatterplot -it should use all countries and all years.

<mark style="background: #04FF00A6;">Example:</mark> Happiness vs GDP for all countries for all years.

<mark style="background: #04FF00A6;">Your plot must include:</mark>
- geom_point()
- geom_smooth(method = “lm”, se = TRUE)
- Clear axis labels
- A clean theme

<mark style="background: #04FF00A6;">You must be able to explain:</mark>
- What the regression line summarises
- What the grey ribbon represents
- Where uncertainty increases
- Whether linearity seems reasonable
- Focus on clarity — not decoration.

This is a deliberately dense plot.

# <mark style="background: #04FF00A6;">MY WORK STEP 2</mark>

```R
whr <- read_csv("merged_WHR.csv")

ggplot(
  whr,
  aes(
    x = gdp_per_capita,
    y = happiness_score,
  )
) +
  geom_point() +
  labs(
    title = "Happiness graphed against GDP",
    x = "GDP Per Capita",
    y = "Happiness Score"
  ) +
  theme_minimal() + geom_smooth(method = "lm", se = TRUE)
```

![[Pasted image 20260227134816.png]]

The regression line summarises the average value of the data

The grey line represents the uncertainty

The uncertainty increases at the end and near the beginning where there's less data

Linearity seems reasonable
### <mark style="background: #04FF00A6;">Step 3 — Compare Two Relationships</mark>

<mark style="background: #04FF00A6;">Create two additional scatterplots:</mark> Happiness vs two other variables - these are explanatory variables - predictors of happiness.

<mark style="background: #04FF00A6;">For example:</mark>
- Happiness vs Social Support
- Happiness vs Healthy Life Expectancy

<mark style="background: #04FF00A6;">You may:</mark>
- Keep them as separate plots OR
- Use facet_wrap(~variable)

<mark style="background: #04FF00A6;">Be prepared to explain:</mark>
- Which relationship appears strongest?
- How does clustering differ?
- Does regression change interpretation?

### <mark style="background: #04FF00A6;">MY WORK - STEP 3</mark>

```R
ggplot(
  whr,
  aes(
    x = freedom_to_make_life_choices,
    y = happiness_score,
  )
) +
  geom_point(
  ) +
  labs(
    title = "happiness against freedom",
    x = "freedom",
    y = "happiness score"
  ) +
  theme_minimal() + geom_smooth(method = "lm", se = TRUE)
```

![[Pasted image 20260227145906.png]]

```R
ggplot(
  whr,
  aes(
    x = social_support,
    y = happiness_score,
  )
) +
  geom_point() +
  labs(
    title = "happiness graphed against social support",
    x = "social support",
    y = "happiness score"
  ) +
  theme_minimal() + geom_smooth(method = "lm", se = FALSE)
```

![[Pasted image 20260227145931.png]]

Happiness against social support seems to have a stronger relationship.

The clustering differs by being higher in the social support graph, clustering near the middle and end but in the freedom graph it's a lot more spread out.

### <mark style="background: #04FF00A6;">Step 4 — Overplotting and Resolution</mark>

Using all years combined, create a deliberately dense plot of happiness vs one of your explanatory variables (this is what you did at Step 2).

Then apply two design modifications. Choose from:
- Transparency e.g. geom_point (e.g. alpha = 0.4)
- Faceting by group (e.g.facet_wrap(~region))
- Filtering a subgroup (e.g. filter(happiness, region == “South Asia”))
- Aggregating before plotting (e.g. happiness %>% group_by(country) %>% summarise( mean_gdp = mean(gdp_per_capita, na.rm = TRUE), mean_happiness = mean(happiness, na.rm = TRUE) ))

<mark style="background: #04FF00A6;">Be prepared to explain:</mark>
- Why does including multiple years in one plot increase density?
- What was visually hidden in the dense plot?
- How your modification changed perception?
- What comparison became easier?
- Do not apply all methods — choose two and explain them well.

### <mark style="background: #04FF00A6;">MY WORK STEP 4</mark>

```R
ggplot(
  whr,
  aes(
    x = social_support,
    y = happiness_score,
  )
) +
  geom_point() + 
  labs(
    title = "happiness against gdp",
    x = "social support",
    y = "happiness score"
  ) +
  theme_minimal() + geom_smooth(method = "lm", se = TRUE)
```

![[Pasted image 20260227152004.png]]

```R
ggplot(
  whr,
  aes(
    x = social_support,
    y = happiness_score,
  )
) +
  geom_point(
    alpha = 0.4
  ) + facet_wrap(~region) + 
  labs(
    title = "happiness graphed against gdp 2",
    x = "social support",
    y = "happiness score"
  ) +
  theme_minimal() + geom_smooth(method = "lm", se = TRUE)
```

![[Pasted image 20260227152354.png]]

Showing multiple years in one plot increases density simply due to the fact that there is more data being shown.

The separation of regions made the plot less dense and made regional patterns visible.

It became easier to compare how social support affects happiness across the regions.


### <mark style="background: #04FF00A6;">Step 5 — Change the Encoding</mark>

Create one alternative representation of your main relationship. Choose one of the following:
- Highlight one subgroup e.g. aes(color = region)
- Scatterplot matrix (subset variables only) e.g. GGally::ggpairs( happiness %>% select(happiness, gdp_per_capita, social_support, healthy_life_expectancy) )

<mark style="background: #04FF00A6;">You must be able to explain:</mark>
- What became easier to see?
- What became harder?
- Is this exploratory or explanatory?

Keep this focused — one alternative only.

### <mark style="background: #04FF00A6;">MY WORK - STEP 5</mark>

```R
ggplot(
  whr,
  aes(
    x = social_support,
    y = happiness_score,
    color = region
  )
) +
  geom_point(
    alpha = 0.4
  ) + 
  labs(
    title = "happiness graphed against social support",
    x = "social support",
    y = "happiness score"
  ) +
  theme_minimal() + geom_smooth(method = "lm", se = FALSE)
```


![[Pasted image 20260227153139.png]]

It's a little harder now to separate out the different regions and compare them, as they're clustered over each other on the same graph.

This graph is explanatory.


### <mark style="background: #04FF00A6;">Step 6 — Add Annotation</mark>

Filter your data to look at a specific year.

Choose one of your scatterplots and generate it just for that year (your primary one would work).

Add one purposeful annotation. You may:

Highlight one specific observation:

e.g. label an extreme value - highest happiness value

extremely_happy <- happiness %>% filter(year == 2020) %>% slice_max(happiness n = 1)

…..

```
`geom_point(color = “grey80”, alpha = 0.6) +

geom_point(data = extreme_country, color = “red”, size = 3) +

geom_text(data = extreme_country, aes(label = country), vjust = -1, color = “red”)
````
Draw attention to a region/country:

e.g.

aes( gdpPercap, lifeExp, colour = country == “Ireland” )

) + geom_point(alpha = 0.6) + scale_colour_manual(values = c(“grey80”, “green”)) +

Do not over-annotate.

The goal is clarity, not decoration.

You Must Be Able to Explain:

Why you chose this element to highlight

What was not obvious before annotation

How annotation changes interpretation

How annotation differs from a tooltip

### <mark style="background: #04FF00A6;">MY WORK - STEP 6</mark>

![[Pasted image 20260227153955.png]]

It's a little hard to see at first, but Norway has been highlighted separately from the other countries. Norway has a very high social score. This suggests a particular correlation.

### <mark style="background: #04FF00A6;">Step 7 — Add Tooltips</mark>

Convert the same plot to an interactive version using plotly::ggplotly().

Add a tooltip aesthetic. You may include any/all of:

Country name

Happiness score

Other score (E.g. social support, freedom etc.)

Region

e.g.:

ggplot(aes(x = gdp_per_capita, y = happiness, text = paste(“Country:”, country))) + geom_point() + geom_smooth(method = “lm”, se = TRUE)

ggplotly(tooltip = “text”)

You should be able to explain:

What does annotation make easier?

What does tooltips make easier?

Which reduces extraneous cognitive load?

Which increases memory demand?

When would you choose one over the other?

Keep responses concise and specific.
What You Should Be Able to Demo

You must be able to:

Demonstrate regression + uncertainty clearly

Demonstrate one overplotting solution

Demonstrate one encoding change

Demonstrate annotation vs tooltips

Answer specific questions related to concepts covered

Modify your plot live

In your demo you will be asked to:

Show any TWO of the above (at the discretion of the TA)

Answer specific questions related to concepts covered

Modify your plot live




```R
extremely_happy <- whr %>% 
  filter(Year == 2022) %>% 
  slice_max(happiness_score, n = 1000)

ggplot(
  extremely_happy,
  aes(
    x = social_support,
    y = happiness_score,
    colour = country == "Norway"
    
  )
) +
  geom_point(alpha = 0.6) + scale_colour_manual(values = c("grey80", "red")) + 
  labs(
    title = "happiness graphed against gdp",
    x = "gdp per capita",
    y = "happiness score"
  ) +
  theme_minimal()
```

![[Pasted image 20260227153013.png]]

