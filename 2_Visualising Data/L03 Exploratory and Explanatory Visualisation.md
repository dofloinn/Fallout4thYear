
```R
# Install necessary libraries if needed
# Install packages if needed
options(repos = c(CRAN = "https://cloud.r-project.org")) # Set the repository to use

if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}

if (!requireNamespace("plotly", quietly = TRUE)) {
  install.packages("plotly")
}

if (!requireNamespace("countrycode", quietly = TRUE)) {
  install.packages("countrycode")
}  
  
library(tidyverse)
library(plotly)
library(countrycode)

```

Read the CSV
```R
happiness <- read_csv("World-happiness-report-2024.csv")

# Rename columns to make sense
happiness <- happiness %>%
  rename(
    country = `Country name`,
    region  = `Regional indicator`,
    happiness_score = `Ladder score`,
    gdp_per_capita  = `Log GDP per capita`,
    social = `Social support`,
    freedom = `Freedom to make life choices`,     lifeexp = `Healthy life expectancy`,
    generous = Generosity, 
    corruption = `Perceptions of corruption`,
    dystopia = `Dystopia + residual` 
  )

# Quick sanity check
glimpse(happiness)
```

# <mark style="background: #04FF00A6;">Part 1 Practice: Using World Happiness dataset</mark>
\
```R
# Histogram: shows counts and binning effects
ggplot(happiness, aes(x = gdp_per_capita)) +
  geom_histogram(
    bins = 25,
    fill = "grey70",
    colour = "white"
  ) +
  labs(
    title = "Distribution of GDP per Capita",
    x = "Log GDP per capita",
    y = "Number of countries"
  ) +
  theme_minimal()
```

![[Pasted image 20260218080323.png]]

```R
# Density plot: emphasises overall shape, not exact counts
ggplot(happiness, aes(x = gdp_per_capita)) +
  geom_density(
    fill = "steelblue",
    alpha = 0.4
  ) +
  labs(
    title = "Density of GDP per Capita",
    x = "Log GDP per capita",
    y = "Density"
  ) +
  theme_minimal()
```

![[Pasted image 20260218080724.png]]


What does the histogram make easy to see?
- It makes it easy to see the peaks and troughs of the chart     

What does the density plot reveal more clearly?
- Where the average/greatest mass lies    

What information is lost when moving from histogram to density?
- It lacks the fine grain

# <mark style="background: #04FF00A6;">Task 2 — Scale as an Analytical Decision</mark>

Modify your histogram by:
- Changing one design decision (bin width or scale).

Example
Code

```R
# Histogram with fewer, wider bins
ggplot(happiness, aes(x = happiness_score)) +
  geom_histogram(
    bins = 10,
    fill = "grey70",
    colour = "white"
  ) +
  labs(
    title = "Distribution of Happiness Scores (10 bins)",
    x = "Happiness score",
    y = "Number of countries"
  ) +
  theme_minimal()
```

![[Pasted image 20260218080921.png]]

```R
# Histogram with more, narrower bins
ggplot(happiness, aes(x = happiness_score)) +
  geom_histogram(
    bins = 40,
    fill = "grey70",
    colour = "white"
  ) +
  labs(
    title = "Distribution of Happiness Scores (40 bins)",
    x = "Happiness score",
    y = "Number of countries"
  ) +
  theme_minimal()
```

![[Pasted image 20260218081002.png]]

```R
# Histogram on original scale
ggplot(happiness, aes(x = happiness_score)) +
  geom_histogram(
    bins = 25,
    fill = "grey70",
    colour = "white"
  ) +
  labs(
    title = "Distribution of Happiness Scores",
    x = "Happiness score",
    y = "Number of countries"
  ) +
  theme_minimal()
```

![[Pasted image 20260218081458.png]]

```R
# Histogram on log scale - using scale_x_log10()
ggplot(happiness, aes(x = happiness_score)) +
  geom_histogram(
    bins = 25,
    fill = "grey70",
    colour = "white"
  ) +
  scale_x_log10() +
  labs(
    title = "Distribution of Happiness Scores (Log Scale)",
    x = "Happiness score (log scale)",
    y = "Number of countries"
  ) +
  theme_minimal()
```

What changed visually?
- The amount of detail seen changes

What did _not_ change in the data?
- The concentration of the graph around 6

Why does scale choice matter for interpretation?
- A scale too wide omits detail needed for good interpretation. A scale too narrow is needlessly complicated

# <mark style="background: #04FF00A6;">Task 3 — Distribution Across Groups</mark>

From the World Happiness dataset choose:
- one numerical variable
- one categorical variable (region or country)
- Create either box plot or violin plot comparing groups.
- Reduce the number of regions/countries if it improves interpretability (consider 5 or 6).
- Reorder groups if it improves interpretability.

Example Code

```R
# Box plot: fast comparison of medians and spread
ggplot(happiness, aes(x = region, y = happiness_score)) +
  geom_boxplot() +
  coord_flip() +
  labs(
    title = "Happiness Scores by Region",
    x = NULL,
    y = "Happiness score"
  ) +
  theme_minimal()
```

![[Pasted image 20260218082058.png]]

```R
# Violin plot: richer view of distribution shape
ggplot(happiness, aes(x = region, y = happiness_score)) +
  geom_violin(
    fill = "steelblue",
    alpha = 0.5
  ) +
  coord_flip() +
  labs(
    title = "Distribution of Happiness Scores by Region",
    x = NULL,
    y = "Happiness score"
  ) +
  theme_minimal()
```

![[Pasted image 20260218082133.png]]

Which group appears most variable?
- Middle East and North Africa

Which chart answers this comparison faster?
- Violin plot

Is this chart more suitable for exploration or explanation? Why?
- Exploratory

# <mark style="background: #04FF00A6;">Task 4 Restructuring to Enable Comparison</mark>

Identify a comparison that is not possible in the dataset’s current structure.

Restructure the data (e.g. wide → long).

Create a chart using:
- colour or
- faceting

Example Code

```R
# Reshape selected variables to long format
h_long <- happiness %>%
  select(region, happiness_score, gdp_per_capita, social, freedom) %>%
  pivot_longer(
    cols = c(gdp_per_capita, social, freedom),
    names_to = "measure",
    values_to = "value"
  )

# Colour-based comparison made possible by restructuring
ggplot(
  h_long,
  aes(
    x = value,
    y = happiness_score,
    colour = measure
  )
) +
  geom_point(
    alpha = 0.5
  ) +
  labs(
    title = "Comparing Predictors of Happiness Using Colour",
    x = NULL,
    y = "Happiness score",
    colour = "Measure"
  ) +
  theme_minimal()
```

![[Pasted image 20260218084622.png]]

```R
# Faceted comparison made possible by restructuring
ggplot(h_long, aes(x = value, y = happiness_score)) +
  geom_point(alpha = 0.5) +
  facet_wrap(~ measure, scales = "free_x") +
  labs(
    title = "Comparing Predictors of Happiness",
    x = NULL,
    y = "Happiness score"
  ) +
  theme_minimal()
```

![[Pasted image 20260218084710.png]]

Why was restructuring necessary?
- Long data reduces cognitive load

What comparison does the new structure enable?
- 

What would the viewer have to remember if the data stayed wide?


### <mark style="background: #04FF00A6;">Part 2 Assessment Task: Using Spotify dataset</mark>

This section forms the basis of the assessment CA Demonstration 2.

You must demonstrate that you can transfer visualisation principles to a dataset previously used, but with new questions and comparisons.

You must use the Spotify dataset we used last week (available in Brightspace) -high_popularity_spotify_data.csv

You will be assessed on your ability to:

choose appropriate charts for a given question

justify design decisions using perceptual reasoning

explain how structure affects comparison

transfer knowledge to a new context

You are not being assessed on:

matching the examples provided

producing a specific chart type

visual decoration

You are not expected to perfect every task — focus on producing clear examples that you can explain.

```R
spotify <- read_csv("high_popularity_spotify_data.csv")
```


### <mark style="background: #04FF00A6;">Task 5 — Distribution and Scale</mark>

Choose one Spotify audio feature
- energy: Perceived intensity and activity (loud, fast, noisy = high energy)
- danceability: How suitable the track is for dancing (rhythm stability, beat strength)
- valence: Musical positivity (sad → happy)
- acousticness: Likelihood the track is acoustic (vs electronic)
- instrumentalness: Likelihood the track has no vocals
- liveness: Likelihood the track was performed live
- speechiness: Amount of spoken words (rap, spoken word, etc.)

1. Create a histogram using the raw scale for the variable.
2. Change one design decision (bin width or scale).

You may be asked:
- What does each version make easier or harder to see?
- Which version is more suitable for exploration?
- What is the biggest perceptual impact of the design choice ?

### <mark style="background: #04FF00A6;">MY WORK TASK 5</mark>

```R
# Raw scale
ggplot(spotify, aes(x = liveness)) +
  geom_histogram(
    fill = "steelblue",
    colour = "white"
  ) +
  labs(
    title = "Livesness of Spotify music",
    x = "Likelihood of song being live",
    y = "Amount of songs"
  ) +
  theme_minimal()
```

![[Pasted image 20260218090033.png]]


```R
# Changed the bins to have a width of 100
ggplot(spotify, aes(x = liveness)) +
  geom_histogram(
	bins = 100,
    fill = "steelblue",
    colour = "white"
  ) +
  labs(
    title = "Liveness of Spotify music",
    x = "Likelihood of song being live",
    y = "Amount of songs"
  ) +
  theme_minimal()
```

![[Pasted image 20260218133255.png]]

What does each version make easier or harder to see?
- The first version makes it easier to see the general shape of the histogram without giving too much cognitive load to the user
- the second makes it easier to see more detail and view the distribution of outliers but has a higher cognitive load with an unnecessary amount of detail

Which version is more suitable for exploration?
- The first is better as it shows a lot of detail without being overcomplicated

What is the biggest perceptual impact of the design choice ?
- Cognitive load. The second histogram is overcomplicated

# <mark style="background: #04FF00A6;">Task 6 — Comparing Distributions Across Groups</mark>

Choose:
1.  one audio feature (e.g. energy, danceability, valence, loudness, tempo)
2. one grouping variable (e.g. ``playlist_genre``, ``playlist_subgenre``, mode, ``time_signature``)
3. Create a box plot or violin plot.
4. Reduce the number of grouping values if it improves interpretability (consider 5 or 6).
5. Reorder groups if appropriate.

You may be asked:
- Which group is most variable?
- Which chart answers the comparison fastest?
- Is this exploratory or explanatory? Why?

# <mark style="background: #04FF00A6;">My work Task 6</mark>

```R
# Violin plot: richer view of distribution shape
ggplot(spotify, aes(x = tempo, y = playlist_genre)) + 
	geom_violin( 
		fill = "steelblue", 
		alpha = 0.5 
	) + 
	labs( 
		title = "Tempo by playlist genre", 
		x = "tempo", 
		y = "playlist genre" 
	) + 
	theme_minimal()
```

![[Pasted image 20260218135924.png]]

```R
ggplot(
  spotify %>%
    group_by(playlist_genre) %>%
    filter(n() %in% sort(table(spotify$playlist_genre), decreasing = TRUE)[1:6]),
  aes(x = tempo, y = playlist_genre)
) +
  geom_violin(fill = "steelblue", alpha = 0.5) +
  labs(
    title = "Tempo by Playlist Genre (Top 6)",
    x = "Tempo",
    y = "Playlist Genre"
  ) +
  theme_minimal()
```

![[Pasted image 20260218140622.png]]

Which group is most variable?
- pop is the most variable

Which chart answers the comparison fastest?
- The second one

Is this exploratory or explanatory? Why?
- This is exploratory as it reduces working memory load and communicates a message that sacrifices completeness for clarity


# <mark style="background: #04FF00A6;">Task 7 — Data Restructuring for Feature Comparison</mark>

Spotify audio features are stored in wide format.
- Reshape the dataset to long format.
- Create a chart comparing multiple audio features.

You may be asked:
- Why was pivoting necessary?
- What comparison does the new structure enable?
- How does this reduce cognitive load for the viewer?

# <mark style="background: #04FF00A6;">My work task 7</mark>

```R
# Task 7 pivot longer

# filters to the top 6 genres based on number of songs
top6 <- names(sort(table(spotify$playlist_genre), decreasing = TRUE))[1:6]
spotify_top6 <- spotify[spotify$playlist_genre %in% top6, ]

# pivots the data to be longer
spotify_long <- pivot_longer(
  spotify_top6,
  cols = c(energy, danceability, tempo, speechiness),
  names_to = "feature",
  values_to = "value"
)

ggplot(spotify_long, aes(x = 1, y = value, colour = playlist_genre, fill = playlist_genre)) +
  geom_violin(alpha = 0.5) +
  facet_wrap(~ feature, scales = "free_y") +
  theme_minimal() +
  labs(
    title = "comparison of spotify audio features across the top 6 genres",
    x = "",
    y = "Value",
    colour = "Playlist Genre"
  ) +
  theme_minimal()
```

![[Pasted image 20260218163218.png]]

Why was pivoting necessary?
- The original dataset was in **wide format**, meaning each feature was stored in a separate column so ggplot couldn't compare them

What comparison does the new structure enable?
- Direct comparison of distributions across multiple audio features

How does this reduce cognitive load for the viewer?
- The differences are immediately visible between audio features and genre
### <mark style="background: #04FF00A6;">Task 8 — Reflection (Short Answers Required)</mark>

Consider the following questions - be prepared to answer one of them. Your answer should focus on **the viewer**, not the code.

You should be able to illustrate your answer by referring to charts you have created.

Why does scale influence what patterns become visible?
- If a scale is too large, the meaningful data variation is too small to be seen

Why is a chart that works well for exploration not always suitable for explanation?
- Exploration has no clear conclusion and often shows the entire data set. This does not work for explanatory data that has a clear conclusion and the extra data in an exploratory graph may take away from the message.

How does data restructuring support perceptual comparison?
- By restructuring the data to be more human readable, the viewer can better understand what is being compared and how the data differs