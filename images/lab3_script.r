library(tidyverse)
library(plotly)
library(countrycode)
spotify <- read_csv("high_popularity_spotify_data.csv")

# Task 5 raw scale
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

# Task 6 Violin plot of all genres
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

# Violin plot of 6 genres
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