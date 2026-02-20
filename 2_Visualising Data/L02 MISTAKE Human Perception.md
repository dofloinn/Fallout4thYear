Install:
```R
install.packages("tidyverse")  
install.packages("zoo")
install.packages("treemap")
```

Load:
```R
library(tidyverse)
library(zoo)
library(treemap)
```

Load data:
```R
mxmh <- read.csv("C:\\Users\\dervl\\OneDrive\\Desktop\\Coding\\4thYear\\VisualisingData\\lab2\\data\\mxmh_survey_results.csv")
```


## 2.1 Select variables of interest

We are going to extract a small number of variables from the dataset to work with: timestamp, streaming service, anxiety score, depression score, insomnia score, OCD score. We create a new dataframe by using the **select** function to select those variables out of the dataset into which we read the entire dataset.

Code

```R
mh_data <- mxmh %>%
  select(
    Timestamp,
    Primary.streaming.service,
    Anxiety,
    Depression,
    Insomnia,
    OCD
  )
# `Primary Streaming Services` to deal with spaces
```


## 2.2 Rename Specific Columns

We rename some of the columns to make them easier to work with - change Timestamp to Date and Primary streaming service to StreamingServce:

Code

```R
mh_data <- mh_data %>%
  rename(
    Date = Timestamp,
    StreamingService = Primary.streaming.service
  )
```

## 2.3. Parse the timestamp correctly

We want to analyse analyse trends over time rather than individual survey entries so we add a new column to the dataset **yearmon** - the year and the month which we extract using the **as.yearmon** function from the zoo package. But first because the timestamps are in month/day/year hour:minute format we need to reformat using **lubridate::mdy_hm()** (already included in tidyverse) to convert to month day year hour min:

Code

```R
mh_data <- mh_data %>%
  mutate(
    Date = as.character(Date),
    Date = lubridate::mdy_hms(Date, tz = "UTC")
  )
```

Note: Date-time data must be parsed using a function that exactly matches its format. Here, the timestamps include seconds and use 24-hour time, so we use mdy_hms().


I also had to mutate the empty strings that weren't labelled as NA:
```R
library(stringr)

mh_summary %>%
  mutate(
    StreamingService = str_trim(StreamingService),
    StreamingService = na_if(StreamingService, "")
  ) %>%
  filter(!is.na(StreamingService)) %>%
  group_by(StreamingService) %>%
  summarise(Anxiety = mean(Anxiety, na.rm = TRUE)) %>%
  ggplot(aes(x = StreamingService, y = Anxiety)) +
  geom_col(fill = "steelblue") +
  labs(
    title = "Average Anxiety Scores by Streaming Service",
    x = "Streaming Service",
    y = "Average Anxiety Score"
  ) +
  theme(axis.text.x = element_text(angle = 90, vjust = 1))

```
## 2.4 Create a YearMon Variable (Represent a distinct month)

Code

```R
mh_data$Yearmon <- zoo::as.yearmon(mh_data$Date)
```

# 3. Summarizing the Data

Raw survey data contains many overlapping responses. This creates visual noise, which overwhelms working memory and prevents effective selective attention.

By summarising the data, we reduce the number of visual elements while preserving meaningful patterns.

We want to get the average mental health scores by streaming service and month.

We create a new dataset mh_summary from mh_data: - we group by StreamingService and the new column Yearmon - for each group we summarise Anxiety, Depression, Insomnia and OCD scores - the summarization we apply is the mean - we filter out any rows where StreamingService does not have a value - using filter and !is.na

Code

```R
mh_summary <- mh_data %>%
  group_by(StreamingService, Yearmon) %>%
  summarise(
    Anxiety = mean(Anxiety, na.rm = TRUE),
    Depression = mean(Depression, na.rm = TRUE),
    Insomnia = mean(Insomnia, na.rm = TRUE),
    OCD = mean(OCD, na.rm = TRUE)
  ) %>%
  filter(!is.na(StreamingService))

# Remove na's to focus on only what can be encoded
mh_summary <- mh_summary %>%
  filter(
    !is.na(Yearmon),
    !is.na(Anxiety)
  )

View(mh_summary)
```

## BEFORE: Raw Survey Data (Perceptual Overload)

Code

```R
mh_data %>%
  ggplot(aes(
    x = Date,
    y = Anxiety,
    colour = StreamingService
  )) +
  geom_point(alpha = 0.3) +
  labs(
    title = "Raw Anxiety Scores (Individual Survey Responses)",
    subtitle = "High visual noise overwhelms selective attention",
    x = "Date",
    y = "Anxiety Score"
  ) +
  theme_minimal()
```

![[Pasted image 20260208113146.png]]

You should notice:
- Overplotting
- Colour competition
- No clear trend
- Too many items for working memory to track

The viewer sees **data**, but cannot extract information.

## AFTER: Summarised Data (Perceptually Manageable)

Code

```R
mh_summary %>%
  ggplot(aes(
    x = Yearmon,
    y = Anxiety,
    colour = StreamingService
  )) +
  geom_line() +
  labs(
    title = "Average Anxiety Scores Over Time",
    subtitle = "Summarising reduces noise and reveals trends",
    x = "Year and Month",
    y = "Average Anxiety Score"
  ) +
  theme_minimal()
```

![[Pasted image 20260208114451.png]]

When you compare this plot to the raw (BEFORE) version, several important changes should stand out.

Fewer visual elements
- The raw plot contained hundreds of overlapping points.
- This plot contains one line per streaming service.
- Reducing the number of visual elements lowers **cognitive load**, making the chart easier to process.

Trends are now visible
- In the raw data, values appeared scattered and noisy.
- Here, overall increases, decreases, or stability over time become apparent.
- Line charts support **pattern detection**, which the visual system struggles to do when data is unstructured.

Colour carries meaning
- Colour now represents grouping (streaming service), not individual responses.
- Each colour corresponds to a single, continuous line.
- This supports **categorisation** without overwhelming attention.

Your eye knows where to look
- Lines guide the eye smoothly from left to right.
- Time is perceived as a continuous sequence rather than isolated points.
- This supports **selective attention** by reducing visual search.

NOTE: The data has not changed — perception has - No new data was added. - The transformation makes existing patterns perceptible.

**Summarising** data helps visualisation **work with** the limits of human perception, not against them.

# 4. Visual Encoding — Good vs Bad

In this section, we deliberately create multiple visualisations from the same data to show how visual encoding choices affect what viewers notice, understand, and remember.

Each chart answers a different question. Pay attention to what the chart is trying to show and how easy that is to perceive.

## 4.1 Comparison Bar Charts

We begin with a categorical comparison: Which streaming services have higher average anxiety scores overall?

This plot ignores time and focuses only on category comparison.

### BAD Bar Chart -Redundant Encoding

Code

```R
# BAD bar chart:
# Uses both fill and colour to encode the same variable (StreamingService)
# This adds visual clutter without adding information

mh_summary %>%
  ggplot(aes(
    x = StreamingService,
    y = Anxiety,
    fill = StreamingService,
    colour = StreamingService
  )) +
  geom_bar(stat = "identity") +
  labs(title = "Average Anxiety by Streaming Service") +
  theme(axis.text.x = element_text(angle=90, vjust=1))
```

![[Pasted image 20260208114739.png]]

**Why this is poor?**

Redundant encoding: colour and fill encode the same information

The viewer’s attention is split between:
- bar height
- colours
- legend

Colour adds no new meaning but increases cognitive load

This violates the principle of **economy of encoding**.

### GOOD Bar Chart: Reduced Encoding[](https://brightspace.tudublin.ie/content/enforced/503815-CMPU-4091-41979-TU856-FT-202510/CMPU4091-L2-Categorization.html?ou=503815&d2l_body_type=3#good-bar-chart-reduced-encoding)

Code

```R
# GOOD bar chart:
# Uses bar height only to encode anxiety levels
# Colour is fixed to reduce distraction

mh_summary %>%
  group_by(StreamingService) %>%
  summarise(Anxiety = mean(Anxiety)) %>%
  ggplot(aes(x = StreamingService, y = Anxiety)) +
  geom_col(fill = "steelblue") +
  labs(
    title = "Average Anxiety Scores by Streaming Service",
    x = "Streaming Service",
    y = "Average Anxiety Score"
  ) +
  theme(axis.text.x = element_text(angle=90, vjust=1))
```

![[Pasted image 20260208114804.png]]

**Why this works better**
- Bar height does all the work
- No legend is required
- The viewer can immediately compare categories

This design supports **selective attention** by reducing unnecessary visual signals.

## BETTER: Order, Horizontal Bar Chart

Code

```R
mh_summary %>%
  group_by(StreamingService) %>%
  summarise(Anxiety = mean(Anxiety, na.rm = TRUE)) %>%
  ggplot(aes(
    x = reorder(StreamingService, Anxiety),
    y = Anxiety
  )) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Average Anxiety Scores by Streaming Service",
    subtitle = "Streaming services ordered by average anxiety",
    x = "Streaming Service",
    y = "Average Anxiety Score"
  ) +
  theme_minimal()
```

![[Pasted image 20260208120645.png]]

## 4.2 Comparing Multiple Variables — Stacked vs Faceted Bars[](https://brightspace.tudublin.ie/content/enforced/503815-CMPU-4091-41979-TU856-FT-202510/CMPU4091-L2-Categorization.html?ou=503815&d2l_body_type=3#comparing-multiple-variables-stacked-vs-faceted-bars)

Next, we compare multiple mental health measures across streaming services.

The question here is: How do different mental health scores compare across services?

First, reshape the data to a long format:

Code

```R
mh_long <- mh_data %>%
  pivot_longer(
    cols = Anxiety:OCD,
    names_to = "Condition",
    values_to = "Score"
  )
```

This creates a new dataset mh_long which contains:
- the same data
- the same values
- but arranged in a way that makes it possible to compare multiple mental health variables in one plot.

![[Pasted image 20260208120738.png]]

This format was:
- easy for reading tables
- good for single-variable plots

But it’s awkward when you want to:
- compare Anxiety and Depression and Insomnia
- map variable names to colour or facets

After mh_long - All mental health variables are stored in one column:
![[Pasted image 20260208120814.png]]

### BAD: Stacked Bar Chart[](https://brightspace.tudublin.ie/content/enforced/503815-CMPU-4091-41979-TU856-FT-202510/CMPU4091-L2-Categorization.html?ou=503815&d2l_body_type=3#bad-stacked-bar-chart)

Code

```R
# BAD stacked bar chart:
# Stacking makes it hard to compare individual conditions

ggplot(mh_long, aes(
  x = StreamingService,
  y = Score,
  fill = Condition
)) +
  geom_col(position = "stack") +
  labs(
    title = "Mental Health Scores by Streaming Service"
  )
```

![[Pasted image 20260208120919.png]]

**Why this is poor**
- Only the bottom segment has a common baseline
- Comparing Anxiety across services requires:
    - colour matching
    - estimating segment height
    - remembering legend order
- This overloads working memory

Stacked bars are poor for precise comparison of individual categories

```R
# BETTER faceted bar chart:
# Each condition gets its own panel with a common baseline

ggplot(mh_long, aes(
  x = StreamingService,
  y = Score,
  fill = Condition
)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ Condition) +
  labs(
    title = "Mental Health Scores by Streaming Service",
    subtitle = "Faceting reduces comparison effort",
    x = "Streaming Service",
    y = "Average Score"
  ) +
  theme_minimal()
```

![[Pasted image 20260208121026.png]]

**Why is this better**

- Each condition has its own space
    
- Comparisons rely on position, not colour memory
    
- The viewer can focus on one condition at a time
    

Faceting supports **selective attention** and reduces **cognitive load**.

## 4.3 Change Over Time — Line Charts[](https://brightspace.tudublin.ie/content/enforced/503815-CMPU-4091-41979-TU856-FT-202510/CMPU4091-L2-Categorization.html?ou=503815&d2l_body_type=3#change-over-time-line-charts)

Now we examine how anxiety changes over time.

The question here is: How do anxiety levels evolve across months for different services?

### BAD line chart[](https://brightspace.tudublin.ie/content/enforced/503815-CMPU-4091-41979-TU856-FT-202510/CMPU4091-L2-Categorization.html?ou=503815&d2l_body_type=3#bad-line-chart)

Code

```R
# BAD line chart:
# Multiple lines and colours compete for attention

ggplot(
  mh_summary,
  aes(
    x = Yearmon,
    y = Anxiety,
    colour = StreamingService
  )
) +
  geom_line() +
  labs(
    title = "Average Anxiety Over Time"
  )
```

# COME BACK TO THIS - FIX GHOST BARS