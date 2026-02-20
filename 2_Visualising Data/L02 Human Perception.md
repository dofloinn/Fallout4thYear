Install Packages:
```R
install.packages("tidyverse")  
install.packages("zoo")
```

Load packages:
```R
library(tidyverse)  
library(zoo)
```

# Step 1. Create a new dataframe using a Grouping variable

During the lecture we grouped mental health scores by streaming service.

In this lab, you will repeat the same workflow, but group the data by **Fav genre (favourite music genre)**.

Create a new dataframe that includes:
- the grouping variable
- at least one mental health score from Depression, Insomnia, or OCD
    - You **should not use** Anxiety as it is used to provide examples in this lab

For example: This code creates a dataset with Favourite Genre and Anxiety and will also rename Fav genre as group.

Code

```R
mh_grouped <- mxmh %>% select(`Fav genre`, Anxiety) %>% rename(Group = `Fav genre`)
```


# MY WORK STEP 1

```R
mh_grouped <- mxmh %>% select(`Fav genre`, OCD) %>% rename(Group = `Fav genre`)
```

## Checkpoint[](https://brightspace.tudublin.ie/content/enforced/503815-CMPU-4091-41979-TU856-FT-202510/CMPU4091-P2-Instructions.html?ou=503815&d2l_body_type=3#checkpoint)

- How many unique categories does Fav Genre have?
    - use the unique function to find out to find out about the unique function use the help e.g. ?unique
- Are some categories very rare?
    - use count and arrange - mh_grouped %>% count(Group, name = “n”) %>% arrange(n)
        
    - What problem might this cause for visualisation?

# MY WORK CHECKPOINT

```
unique(mh_grouped$Group)
```

![[Pasted image 20260210103158.png]]

There are 16 unique categories in Fav genre

```R
mh_grouped %>% count(Group, name = "n") %>% arrange(n)
```

![[Pasted image 20260210103445.png]]

Latin and Gospel are very rare in comparison to Pop and Rock

This can cause issues when attempting to compare categories as there will be less data for the rarer categories. Also the volume of data may eclipse the smaller categories

# Step 2 - Summarise your Data

If you use raw survey responses for this task you will have issues:
- Hundreds of points overwhelm attention
- Category comparisons become impossible
- Noise hides patterns

Summarise your data so that:
- each category has one value
- mental health scores are averaged

For example: This code uses our reduced dataset and summarises Anxiety scores by Group (Fav Genre) - we are summarising to get the mean:

Code

```R
mh_summary2 <- mh_grouped %>%
  group_by(Group) %>%
  summarise(
    Anxiety = mean(Anxiety, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  filter(!is.na(Group))
```

# MY WORK STEP 2

```R
mh_summary2 <- mh_grouped %>%
  group_by(Group) %>%
  summarise(
    OCD = mean(OCD, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  filter(!is.na(Group))
```

The summary reduces noise - which allows for patterns to emerge.

# Step 3: Categorization Variables

Create a bad visualisation that makes category comparison difficult.

You must include at least two of the following problems:
- redundant encoding (e.g. colour + fill for the same variable)
- too many colours
- poor ordering of categories
- unnecessary legends

Make sure your x axis labels are readable Refer to week 1 examples and practicals to make sure the x axis labels are readable. Example:

Code

```R
ggplot(mh_summary2, aes(
  x = Group,
  y = Anxiety,
  fill = Group,
  colour = Group
)) +
  geom_col() +
  labs(
    title = "Average Anxiety Categorized by Favourite Music Genre",
    x = "Genre",
    y = "Anxiety"
  ) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )
```

# MY WORK STEP 3

```R
ggplot(mh_summary2, aes(
  x = Group,
  y = OCD,
  fill = Group,
  colour = Group
)) +
  geom_col() +
  labs(
    title = "Average Anxiety Categorized by Favourite Music Genre",
    x = "Genre",
    y = "OCD"
  ) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )
```

![[Pasted image 20260210105248.png]]

## Task - Correct some of the issues[](https://brightspace.tudublin.ie/content/enforced/503815-CMPU-4091-41979-TU856-FT-202510/CMPU4091-P2-Instructions.html?ou=503815&d2l_body_type=3#task---correct-some-of-the-issues)

Redesign the chart so that:
- bar length does most of the work
- colour is fixed or removed
- categories are easy to compare


Refer to section 4.1 - sub-section BETTER in CMPU4091-L2-Categorization for an example and code.

```R
ggplot(mh_summary2, aes(
  x = reorder(Group, OCD),
  y = OCD,
)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Average OCD Categorized by Favourite Music Genre",
    x = "Genre",
    y = "OCD"
  ) +
  theme_minimal()
```

![[Pasted image 20260210110103.png]]

Checkpoint:

The viewer notices the length first in the chart

# Step 4: Comparing Multiples

## Task 4.1 Create a new dataframe[](https://brightspace.tudublin.ie/content/enforced/503815-CMPU-4091-41979-TU856-FT-202510/CMPU4091-P2-Instructions.html?ou=503815&d2l_body_type=3#task-4.1-create-a-new-dataframe)

Repeat Steps 1 and 2 and include a second mental health variable.

## Task 4.2 Reshape your data to support multiple comparisons[](https://brightspace.tudublin.ie/content/enforced/503815-CMPU-4091-41979-TU856-FT-202510/CMPU4091-P2-Instructions.html?ou=503815&d2l_body_type=3#task-4.2-reshape-your-data-to-support-multiple-comparisons)

Reshape your data from wide to long format (see section 4.2 in CMPU4091-L2-Categorisation.qmd).

## Task 4.3 Create Visualizations to support multiple comparisons[](https://brightspace.tudublin.ie/content/enforced/503815-CMPU-4091-41979-TU856-FT-202510/CMPU4091-P2-Instructions.html?ou=503815&d2l_body_type=3#task-4.3-create-visualizations-to-support-multiple-comparisons)

Create a stacked chart (bad visualization) followed by faceting (good visualization). - refer to Section 4.2 Comparing Multiple Variables in CMPU4091-L2-Categorisation.qmd.

Make sure your x axis labels are readable (refer to week 1).

# MY WORK STEP 4

4.1 repeat 1 and 2 with another variable:
```R
mh_grouped2 <- mxmh %>% select(`Fav genre`, OCD, Depression) %>% rename(Group2 = `Fav genre`)
```

4.2 reshape for multiple comparisons:

```R
mh_long <- mh_grouped2 %>%
  pivot_longer(
    cols = OCD:Depression,
    names_to = "Condition",
    values_to = "Score"
  )
```

4.3 bar charts

stacked - bad:
```R
ggplot(mh_long, aes(
  x = Group2,
  y = Score,
  fill = Condition
)) +
  geom_col(position = "stack") +
  labs(
    title = "Mental Health Scores by Genre"
  )
```

![[Pasted image 20260210112656.png]]

faceted - good:
```R
ggplot(mh_long, aes(
  x = Group2,
  y = Score,
  fill = Condition
)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ Condition) +
  labs(
    title = "Mental Health Scores by Genre",
    x = "Streaming Service",
    y = "Average Score"
  ) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )
```

![[Pasted image 20260210112915.png]]

## Checkpoint[](https://brightspace.tudublin.ie/content/enforced/503815-CMPU-4091-41979-TU856-FT-202510/CMPU4091-P2-Instructions.html?ou=503815&d2l_body_type=3#checkpoint-3)

Why is faceting better than stacking for this task?

Which visual encoding (colour, position, length) does most of the work in the faceted chart?

Faceting is better as the data is separated enough for humans to compare and comprehend it easily.

In the faceted chart, length is doing most of the work.

# Step 5: Applying Good Visualization Practice to a Different Dataset

In this final step, you will apply the same visualisation and categorisation principles to a different dataset.

The goal is to show that good visualisation practices transfer across datasets, even when the variables change.

This example uses the Spotify Music Dataset (High Popularity subset) from Kaggle: https://www.kaggle.com/datasets/solomonameh/spotify-music-dataset

The dataset contains information about popular Spotify tracks, including:
- audio features (e.g. danceability, energy, valence)
- artist and genre information
- popularity scores derived from Spotify

Each row represents one song.

This dataset is well suited to categorisation tasks because it includes:
- multiple categorical variables (e.g. genre, artist)
- multiple continuous numeric variables (e.g. energy, danceability, popularity)

### Task 5.1 - Setup the data

Download the dataset from Brightspace (high_popularity_spotify_data.csv) and read it into a dataframe Choose a Grouping Variable and Multiple Measures

Choose one categorical variable to group by:
- playlist_genre
- artist_name

Choose two numeric variables to compare:
- track_popularity
- energy
- danceability
- valence

Create a reduced dataset containing your grouping variable and both numeric measures.

# MY WORK Step 5.1

```R
# Read in your data
spotify <- read_csv("data/high_popularity_spotify_data.csv")
```

```R
spotify_grouped <- spotify %>% select(playlist_genre, energy) %>% rename(Group = playlist_genre)
```


### Task 5.2 - Summarise Before Visualising

Summarise the dataset so that:
- each category has one value
- the numeric variables are averaged

# MY WORK STEP 5.2

```R
spotify_summary <- spotify_grouped %>%
  group_by(Group) %>%
  summarise(
    energy = mean(energy, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  filter(!is.na(Group))
```

## Task 5.3 - Create an Effective Comparison Chart[](https://brightspace.tudublin.ie/content/enforced/503815-CMPU-4091-41979-TU856-FT-202510/CMPU4091-P2-Instructions.html?ou=503815&d2l_body_type=3#task-5.3---create-an-effective-comparison-chart)

Create a clear and effective bar chart that allows the viewer to compare categories easily for one of numeric variables (popularity, energy, danceability, valence).

Your chart must:
- rely primarily on bar length and position
- use fixed or minimal colour
- order categories to support comparison
- ensure axis labels are readable

# MY WORK 5.3

```R
ggplot(spotify_summary, aes(
  x = reorder(Group, energy),
  y = energy,
)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Average Energy Categorized by Playlist Genre",
    x = "Genre",
    y = "Energy"
  ) +
  theme_minimal()
```

![[Pasted image 20260210115631.png]]


### Task 5.4 - Reshape Data to Support Multiple Comparisons

To compare multiple numeric variables, reshape the data from wide to long format.

# MY WORK 5.4

```R
spotify_grouped2 <- spotify %>% select(playlist_genre, energy,track_popularity,danceability,valence) %>% rename(Group = playlist_genre)
```


```R
spotify_long <- spotify_grouped2 %>%
  pivot_longer(
    cols = energy:track_popularity:danceability:valence,
    names_to = "Measure",
    values_to = "Score"
  )
```

## Task 5.5 - Create an Effective Multi-Comparison Visualisation

Create a visualisation that allows the viewer to:
- compare categories within each measure
- compare patterns across measures
- do so without relying on colour memory

Your chart must:
- use faceting to separate measures
- rely primarily on position and length
- use minimal or fixed colour
- ensure category labels are readable

# MY WORK 5.5

```R
spotify_summary2 <- spotify_long %>%
  group_by(Group, Measure) %>%
  summarise(
    AvgScore = mean(Score, na.rm = TRUE),
    .groups = "drop"
  )
```

```R
ggplot(spotify_summary2, aes(
  x = Group,
  y = AvgScore,
  fill = Measure
)) +
  geom_col() +
  facet_wrap(~ Measure, scales = "free_y") +
  labs(
    title = "Measures by Genre",
    x = "Streaming Service",
    y = "Average Score"
  ) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )
```

![[Pasted image 20260210121317.png]]

