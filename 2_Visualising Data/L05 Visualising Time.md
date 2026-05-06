```R
# Set CRAN mirror explicitly (avoids installation prompts)
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Install packages only if missing (keeps environment reproducible)
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}

if (!requireNamespace("eurostat", quietly = TRUE)) {
  install.packages("eurostat")
}

if (!requireNamespace("plotly", quietly = TRUE)) {
  install.packages("plotly")
}

if (!requireNamespace("gapminder", quietly = TRUE)) {
  install.packages("gapminder")
}

if (!requireNamespace("TTR", quietly = TRUE)) {
  install.packages("TTR")
}

if (!requireNamespace("quantmod", quietly = TRUE)) {
  install.packages("quantmod")
}


# Load core packages
library(tidyverse)   # Data wrangling + ggplot2 visualisation framework
library(plotly)      # Adds interactivity to static ggplots
library(gapminder)   # Clean longitudinal dataset (country-level time series)
library(eurostat)    # Access harmonised EU statistics
library(TTR)         # Technical analysis tools (moving averages)

library(quantmod)   # Includes dataset including personal savings rate
```

### <mark style="background: #04FF00A6;">Task 1. Create a Basic Time Trend Chart Showing Average (mean) Daily Departure Delay.</mark>

Required:
- Line chart
- Clear Titles
- Label your axes

Consider: - What do you perceive first — volatility or trend?
- Are delays generally stable or unstable?
- Can you identify seasonal patterns?
- Are there extreme spikes?

### <mark style="background: #04FF00A6;">MY WORK - TASK 1</mark>

```R
ggplot(flights_daily, aes(date, mean_delay)) +
  geom_line(linewidth = 1, colour = "green") +
  labs(
    title = "Mean Daily Departure Time",
    y = "Departure time delay",
    x = "Date"
  ) +
  theme_minimal()
```

![[Pasted image 20260312211738.png]]

<mark style="background: #04FF00A6;">Consider: - What do you perceive first — volatility or trend?</mark>
I see volatility first

<mark style="background: #04FF00A6;">Are delays generally stable or unstable?</mark>
The delays are unstable

<mark style="background: #04FF00A6;">Can you identify seasonal patterns?</mark>
Yes, around St Patrick's day, the beginning of summer

<mark style="background: #04FF00A6;">Are there extreme spikes?</mark>
Yes

### <mark style="background: #04FF00A6;">Task 2. Create a Basic Time Trend Chart of Average (mean) Monthly Departure Delay.</mark>

- Add a group statement to the dataframe creation at Task 0 - group_by (year,month), rather than group_by(date)

Code

```R
flights_monthly <- nycflights13::flights %>%
  mutate(date = make_date(year, month, day)) %>%
  group_by(year, month) %>%
  summarise(
    mean_delay = mean(dep_delay, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  mutate(month_date = make_date(year, month, 1))
```

Create the chart:
- Line chart
- Clear Titles
- Label your axes

### <mark style="background: #04FF00A6;">TASK 2 - MY WORK</mark>

```R
flights_monthly <- nycflights13::flights %>%
  mutate(date = make_date(year, month, day)) %>%
  group_by(year, month) %>%
  summarise(
    mean_delay = mean(dep_delay, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  mutate(month_date = make_date(year, month, 1))

ggplot(flights_monthly, aes(month_date, mean_delay)) +
  geom_line(linewidth = 1, colour = "green") +
  labs(
    title = "Mean Daily Departure Time",
    y = "Departure time delay",
    x = "Date"
  ) +
  theme_minimal()
```

![[Pasted image 20260313102105.png]]

<mark style="background: #04FF00A6;">Consider: - What disappeared compared to the daily chart?</mark>
The concentration of the data. The large outlier in March disappeared

<mark style="background: #04FF00A6;">Did volatility reduce?</mark>
Yes

<mark style="background: #04FF00A6;">Is seasonality clearer?</mark>
Yes, an increase during the summer and near christmas is clearer

<mark style="background: #04FF00A6;">Did aggregation remove noise — or hide signal?</mark>

It removed noise

### <mark style="background: #04FF00A6;">Task 3. Create a Bar Bhart of Monthly Average Delay.</mark>

<mark style="background: #04FF00A6;">Required:</mark>
- Bar chart
- Clear Titles
- Label your axes

<mark style="background: #04FF00A6;">Consider:</mark>
- Does a bar imply discrete measurement?
- Are monthly delays continuous or discrete?
- Does the line imply interpolation between months?
- Which encoding better reflects the structure of the data?
- Is this a formatting decision or a modelling decision?

### <mark style="background: #04FF00A6;">MY WORK - TASK 3</mark>

```R
ggplot(flights_monthly, aes(month_date, mean_delay)) +
  geom_col(fill = "darkgreen") +   # Bars emphasise separate observations
  labs(
    title = "Mean flight delay by month (Bar Chart)",
    subtitle = "Encodes discrete measurements",
    y = "Delay",
    x = "Month"
  ) +
  theme_minimal(base_size = 14)
```

![[Pasted image 20260313102856.png]]

<mark style="background: #04FF00A6;">Consider:</mark>

<mark style="background: #04FF00A6;">Does a bar imply discrete measurement?</mark>
It implies discrete

<mark style="background: #04FF00A6;">Are monthly delays continuous or discrete?</mark>
The monthly delays are discrete

<mark style="background: #04FF00A6;">Does the line imply interpolation between months?</mark>
Yes

<mark style="background: #04FF00A6;">Which encoding better reflects the structure of the data?</mark>
The bar chart

<mark style="background: #04FF00A6;">Is this a formatting decision or a modelling decision?</mark>
Modelling

### <mark style="background: #04FF00A6;">Task 4. Apply LOESS Smoothing to the Daily Delay Line Chart (Task 1)</mark>

<mark style="background: #04FF00A6;">Required: - Line Chart</mark>
- Apply Smoothing (geom_smooth = “loess”)
- Set span = 0.2
- Clear Titles
- Label your axes 

Then: - Increase the span to 0.8

<mark style="background: #04FF00A6;">Consider: - What changes as span increases?</mark>
- Which version emphasises short-term shocks?
- Which version suppresses extreme events?
- Is smoothing neutral?

### <mark style="background: #04FF00A6;">MY WORK - TASK 4</mark>

```R
# span = 0.2
ggplot(flights_daily, aes(date, mean_delay)) +
  geom_line(alpha = 0.3) +   # Raw volatility
  geom_smooth(span = 0.2) +  # LOESS smoothing
  labs(title = "Flight delay daily (Raw + LOESS)",
	  y = "Delay",
	  x = "Date") +
  theme_minimal())

# span = 0.8
ggplot(flights_daily, aes(date, mean_delay)) +
  geom_line(alpha = 0.3) +   # Raw volatility
  geom_smooth(span = 0.8) +  # LOESS smoothing
  labs(title = "Flight delay daily (Raw + LOESS)",
       y = "Delay",
       x = "Date") +
  theme_minimal()
```

![[Pasted image 20260313105737.png]]

![[Pasted image 20260313105751.png]]

<mark style="background: #04FF00A6;">Consider: - What changes as span increases?</mark>

<mark style="background: #04FF00A6;">Which version emphasises short-term shocks?</mark>
The 0.2 one

<mark style="background: #04FF00A6;">Which version suppresses extreme events?</mark>
The 0.8 one

<mark style="background: #04FF00A6;">Is smoothing neutral?</mark>
No, it removes a lot of data for ease of interpretability but this means a lot of information gets lost

### <mark style="background: #04FF00A6;">Task 5. Remove the Top 10% of Average Daily Delays.</mark>

Extreme delays (e.g., weather events) heavily influence perception.

<mark style="background: #04FF00A6;">Required:</mark>
- Filter the top 10% of daily delays filter( abs(mean_delay) < quantile(abs(mean_delay), 0.90, na.rm = TRUE) )
- Line Chart
- Clear Titles
- Label your axes

<mark style="background: #04FF00A6;">Consider: - What disappeared?</mark>
- Does the system now appear more stable?
- Did the scale compress?
- Is this clarification or distortion?

### <mark style="background: #04FF00A6;">MY WORK - TASK 5</mark>

```R
flights_daily_filtered <- flights_daily %>% 
  filter(abs(mean_delay) < quantile(abs(mean_delay), 0.90, na.rm = TRUE))

ggplot(flights_daily_filtered, aes(date, mean_delay)) +
  geom_line() +
  labs(title = "Flight delay daily (Top 10% removed)",
       y = "Delay",
       x = "Month") +
  theme_minimal()
```

![[Pasted image 20260313111544.png]]

<mark style="background: #04FF00A6;">Consider: - What disappeared?</mark>

<mark style="background: #04FF00A6;">Does the system now appear more stable?</mark>
Yes, the fluctuations are not as huge

<mark style="background: #04FF00A6;">Did the scale compress?</mark>
Yes, from 80 down to 30 as the max

<mark style="background: #04FF00A6;">Is this clarification or distortion?</mark>
This is distortion - 10% is a large amount of a dataset to remove


### <mark style="background: #04FF00A6;">Task 6. Compare Monthly Average Delays by Carrier.</mark>

Instead of averaging all flights together: Compare delays by carrier (use colour for the comparison.

<mark style="background: #04FF00A6;">Required: - Change the aggregation to group by carrier and month group_by(carrier, month):</mark>
- Line Chart (Multiple Lines)
- Clear Titles
- Label your axes

<mark style="background: #04FF00A6;">Consider:</mark>
- Does this become a spaghetti plot?
- Is colour sufficient for comparison?
- What happens to cognitive load?
- Would faceting reduce perceptual strain?

### <mark style="background: #04FF00A6;">MY WORK - TASK 6</mark>

```R
flights_carrier_monthly <- flights %>% 
	group_by(carrier, month) %>% summarise(
		mean_delay = mean(dep_delay, na.rm = TRUE), 
		.groups = "drop" ) %>%
		mutate(month_date = make_date(2013, month, 1))

ggplot(flights_carrier_monthly, aes(month_date, mean_delay, colour = carrier)) +
	geom_line(linewidth = 1) + 
	labs(
		title = "Mean monthly delay by carrier",
		y = "Delay (mins)", 
		x = "Month", 
		colour = "Carrier" ) + 
	theme_minimal()
```

![[Pasted image 20260313112539.png]]

<mark style="background: #04FF00A6;">Consider:</mark>

<mark style="background: #04FF00A6;">Does this become a spaghetti plot?</mark>
Yes, it is hard to discern detail properly in most of the graph

<mark style="background: #04FF00A6;">Is colour sufficient for comparison?</mark>
No, there are a lot of carriers so the colour is similar

<mark style="background: #04FF00A6;">What happens to cognitive load?</mark>
It increases trying to understand the concentrated areas

<mark style="background: #04FF00A6;">Would faceting reduce perceptual strain?</mark>
Yes

### <mark style="background: #04FF00A6;">Task 7. Highlight Two Carriers - Monthly Average Delay</mark>

Required: - Setup a dataframe from the original flights dataset with that contains the carrier and the mean montly delay

Code

```R
flights_carrier <- flights %>%
  mutate(date = make_date(year, month, day)) %>%
  group_by(carrier, month) %>%
  summarise(mean_delay = mean(dep_delay, na.rm = TRUE),
  .groups="drop")
```

- Line Chart (Multiple Lines)
- Change the colour of all lines to grey except for two specific carriers (your choice) - use a different colour for each. - e.g. filter(carrier %in% c(“DL”, “UA”))
- Clear Titles
- Label your axes

Consider:
- What do you notice first in this version compared to the full-colour version?
- Is it easier to compare DL and UA now?
- Did cognitive load decrease?
- Does removing other carriers remove information or reduce distraction? or both?

### <mark style="background: #04FF00A6;">MY WORK - TASK 7</mark>

```R
# TASK 7 - Highlight two carriers against grey background
flights_carrier <- flights %>%
  mutate(date = make_date(year, month, day)) %>%
  group_by(carrier, month) %>%
  summarise(mean_delay = mean(dep_delay, na.rm = TRUE),
            .groups = "drop") %>%
  mutate(month_date = make_date(2013, month, 1))

background <- flights_carrier %>%
  filter(!carrier %in% c("DL", "UA"))

highlighted <- flights_carrier %>%
  filter(carrier %in% c("DL", "UA"))

ggplot() +
  geom_line(data = background,
            aes(month_date, mean_delay, group = carrier),
            colour = "grey80", linewidth = 0.8) +
  geom_line(data = highlighted,
            aes(month_date, mean_delay, colour = carrier),
            linewidth = 1.4) +
  scale_colour_manual(
    values = c("DL" = "forestgreen", "UA" = "hotpink"),
    labels = c("DL", "UA")
  ) +
  labs(
    title = "Mean monthly Departure Delay by Carrier",
    y = "Mean Departure Delay (mins)",
    x = "Month",
    colour = "Carrier"
  ) +
  theme_minimal()
```

![[Pasted image 20260313113605.png]]

<mark style="background: #04FF00A6;">What do you notice first in this version compared to the full-colour version?</mark>
You notice the two coloured lines

<mark style="background: #04FF00A6;">Is it easier to compare DL and UA now?</mark>
Yes, there's less noise and the focus is clearer

<mark style="background: #04FF00A6;">Did cognitive load decrease?</mark>
Yes, as there were only 2 lines that needed to be interpreted

<mark style="background: #04FF00A6;">Does removing other carriers remove information or reduce distraction? or both?</mark>
Both.

### <mark style="background: #04FF00A6;">Task 8: Small Multiples - Monthly Average Delay by Carrier</mark>

<mark style="background: #04FF00A6;">Required: - Line Chart (Monthly Delay)</mark>
- Include all carriers
- Facet by carrier.
- Clear Titles
- Label your axes

<mark style="background: #04FF00A6;">Consider:</mark>
- Why is this easier to interpret?
- What structural alignment does faceting preserve?
- Why must axes remain consistent?

### <mark style="background: #04FF00A6;">MY WORK - TASK 8</mark>

```R
# TASK 8 - monthly delay faceted by carrier

flights_carrier <- flights %>%
  group_by(carrier, month) %>%
  summarise(mean_delay = mean(dep_delay, na.rm = TRUE),
            .groups = "drop") %>%
  mutate(month_date = make_date(2013, month, 1))

ggplot(flights_carrier, aes(month_date, mean_delay)) +
  geom_line(linewidth = 1, colour = "steelblue") +
  geom_hline(yintercept = 0, linetype = "dashed",
             colour = "grey50", linewidth = 0.4) +
  facet_wrap(~ carrier, ncol = 4) +
  scale_x_date(date_labels = "%b", date_breaks = "3 months") +
  labs(
    title = "Mean Monthly Departure Delay by Carrier",
    subtitle = "2013 | Each panel shares the same axis scale",
    y = "Mean Departure Delay (mins)",
    x = "Month"
  ) +
  theme_minimal() +
  theme(
    strip.text = element_text(face = "bold"),   # bold carrier labels
    panel.spacing = unit(1, "lines")            # breathing room between panels
  )
```

![[Pasted image 20260313114557.png]]

<mark style="background: #04FF00A6;">Consider:</mark>

<mark style="background: #04FF00A6;">Why is this easier to interpret?</mark>
Because the lines are all overlayed on each other

<mark style="background: #04FF00A6;">What structural alignment does faceting preserve?</mark>
They all share the same axes

<mark style="background: #04FF00A6;">Why must axes remain consistent?</mark>
So the data can all be compared on the same scale